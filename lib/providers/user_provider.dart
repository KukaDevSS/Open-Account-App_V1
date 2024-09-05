// ignore_for_file: use_build_context_synchronously, avoid_single_cascade_in_expression_statements

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/user_info.dart';
import 'package:flutter_app_1/services/http_api.dart';
// import 'package:flutter_app_1/services/http_headers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class UserProvider with ChangeNotifier {
  final String _baseUrl = UserApiUrls.baseUrl;
  final String _imageBaseUrl = UserApiUrls.imageBaseUrl;
  final String _loginUrl = UserApiUrls.loginUrl;
  final String _registerUrl = UserApiUrls.registerUrl;

  String? _username;
  String? _token;
  User? _user;

  String? get username => _username;
  String? get token => _token;
  User? get user => _user;
  String? get profileImageUrl =>
      _user != null ? '$_imageBaseUrl${_user!.picture}' : null;

  Future<bool> login(String username, String password, BuildContext context) async {
    final url = Uri.parse(_loginUrl);
    final headers = ApiHeaders.getCommonHeaders();

    final body = json.encode({
      'user': username,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      final decodedResponseBody = utf8.decode(response.bodyBytes);
      print('Response body: $decodedResponseBody');

      if (response.statusCode == 200) {
        final data = json.decode(decodedResponseBody);


        if (data['token'] != null) {
          _username = username;
          _token = data['token'];
          
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', _username!);
          await prefs.setString('token', _token!);
          await prefs.setBool('isRegistered', true);

          if (data['data'] != null && data['data'].isNotEmpty) {
            _user = User.fromJson(data['data'][0]);
            await prefs.setString('user', json.encode(_user!.toJson()));
            print('User data: ${_user!.toJson()}');
          }

          print('Token: $_token');

          await checkTokenExpiration(context);

          notifyListeners();
          return true;
        } else {
          print('Token not found in response.');
          return false;
        }
      } else {
        print('Login failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<void> loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      _user = User.fromJson(json.decode(userData));
    }
  }


  Future<String?> getLoggedInUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      final userJson = json.decode(userData);
      return userJson['EMPNAME'];
    }
    return null;
  }

  Future<bool> register(String username, String password) async {
    final url = Uri.parse(_registerUrl);
    final headers = ApiHeaders.getCommonHeaders();

    final body = json.encode({
      'user': username,
      'password': password,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['error_code'] == "00") {
          return true;
        } else {
          print('Registration failed: ${data['error_desc']}');
          return false;
        }
      } else {
        print('Registration failed with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }

  Future<bool> searchUser(String username) async {
    final url =
        Uri.parse('$_baseUrl/employee?user=$username&branch=ALL&dep=ALL');
    final headers = ApiHeaders.getCommonHeaders();

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final users = data['data'] as List<dynamic>;
        final user = users.firstWhere(
          (user) => user['USERAD'] == username.toUpperCase(),
          orElse: () => null,
        );

        return user != null;
      } else {
        print('Search user failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Search user error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    _username = null;
    _token = null;
    // _user = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('token');
    // await prefs.remove('user');

    notifyListeners();
  }

  Future<void> logoutDialog(BuildContext context) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Logout',
      desc: 'Are you sure you want to logout?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await logout();
        Navigator.of(context).pushReplacementNamed('/login');
      },
    ).show();
  }

  Future<void> checkTokenExpiration(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.parse(_loginUrl);
    final headers = ApiHeaders.getCommonHeaders();
    
    try {
      final response = await http.get(url, headers: {
        ...headers,
        'Authorization': 'Bearer $token',
      });

      final responseBody = json.decode(response.body);
      if (responseBody['error_code'] == '98') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: 'Token Expired',
          desc: 'Your session has expired. Please log in again.',
          btnOkOnPress: () async {
            await logout();
            Navigator.pushReplacementNamed(context, '/login');
          },
        ).show();
      }
    } catch (e) {
      print('Error checking token expiration: $e');
    }
  }

}
