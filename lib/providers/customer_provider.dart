import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/customer_account_info.dart';
import 'package:flutter_app_1/models/customer_info.dart';
import 'package:flutter_app_1/models/product_info.dart';
// import 'package:flutter_app_1/screens/login_screen.dart';
import 'package:flutter_app_1/services/http_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProvider with ChangeNotifier {
  final _baseUrl = CustomerApiUrls.baseUrl;

  Customer? _customer;
  List<CustomerAccount> _accounts = [];
  List<Product> _products = [];
  bool _isLoading = false;
  bool _isSearching = false;

  Customer? get customer => _customer;
  List<CustomerAccount> get accounts => _accounts;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isSearching => _isSearching;

  void setSearching(bool searching) {
    _isSearching = searching;
    notifyListeners();
  }

  void _setLoadingState(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> getCustomerAndAccounts(
      String custNo, BuildContext context) async {
    setSearching(true);
    _setLoadingState(true);

    try {
      final token = await _getToken();
      if (token == null) {
        await _showErrorDialog(context, 'Token not found in SharedPreferences');
        return;
      }

      final headers = ApiHeaders.getCommonHeaders(token: token);

      final customerResponse = await http.get(
        Uri.parse(
            '${CustomerApiUrls.searchCustomerUrl}/customer?search=$custNo'),
        headers: headers,
      );

      if (customerResponse.statusCode == 200) {
        final customerData = json.decode(customerResponse.body);
        final List<dynamic>? data = customerData['data'];

        if (data != null && data.isNotEmpty) {
          _customer = Customer.fromJson(data[0] as Map<String, dynamic>);
        } else {
          await _showErrorDialog(context, 'No customer data available');
          return;
        }

        await _fetchCustomerAccounts(custNo, headers, context);
      } else if (customerResponse.statusCode == 404) {
        final responseBody = json.decode(customerResponse.body);
        print(
          'req.body ${responseBody.toString()}',
        );
        if (responseBody['error_code'] == '98' &&
            responseBody['error_desc'] == 'Token exprid') {
          await _showTokenExpiredDialog(context);
        } else {
          await _showErrorDialog(context, 'Failed to load customer');
        }
      } else {
        await _showErrorDialog(context, 'Failed to load customer');
      }
    } catch (e) {
      await _showErrorDialog(context, 'Error occurred: $e');
    } finally {
      setSearching(false);
      _setLoadingState(false);
    }
  }

  Future<void> getProducts(BuildContext context) async {
    _setLoadingState(true);
    try {
      final token = await _getToken();
      if (token == null) {
        await _showErrorDialog(context, 'Token not found in SharedPreferences');
        return;
      }

      final headers = ApiHeaders.getCommonHeaders(token: token);
      final productResponse = await http.get(
        Uri.parse('$_baseUrl/product'),
        headers: headers,
      );

      if (productResponse.statusCode == 200) {
        final productData = json.decode(productResponse.body);
        final List<dynamic>? productList = productData['data'];

        _products = productList != null && productList.isNotEmpty
            ? productList.map((data) => Product.fromJson(data)).toList()
            : [];
      } else {
        // await _showErrorDialog(context, 'Failed to load products');
        print('Failed to load products');
      }
    } catch (e) {
      await _showErrorDialog(context, 'Error occurred: $e');
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> _fetchCustomerAccounts(
      String custNo, Map<String, String> headers, BuildContext context) async {
    try {
      final accountResponse = await http.get(
        Uri.parse(
            '${CustomerApiUrls.searchCustomerUrl}/account?search=$custNo'),
        headers: headers,
      );

      if (accountResponse.statusCode == 200) {
        final accountData = json.decode(accountResponse.body);
        final List<dynamic>? accountList = accountData['data'];

        _accounts = accountList != null && accountList.isNotEmpty
            ? accountList
                .map((data) {
                  try {
                    return CustomerAccount.fromJson(
                        data as Map<String, dynamic>);
                  } catch (e) {
                    print('Error parsing account data: $e');
                    _showErrorDialog(context, 'Error parsing account data: $e');
                    return null;
                  }
                })
                .where((account) => account != null)
                .cast<CustomerAccount>()
                .toList()
            : [];
      } else if (accountResponse.statusCode == 404) {
        final responseBody = json.decode(accountResponse.body);
        if (responseBody['error_code'] == '98' &&
            responseBody['error_desc'] == 'Token exprid') {
          await _showTokenExpiredDialog(context);
        } else {
          await _showErrorDialog(context, 'Failed to load account data');
        }
      } else {
        await _showErrorDialog(context, 'Failed to load account data');
      }
    } catch (e) {
      await _showErrorDialog(context, 'Error occurred: $e');
    }
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _showErrorDialog(
      BuildContext context, String errorMessage) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      btnOkText: 'OK',
      title: 'Error',
      desc: errorMessage,
    ).show();
  }

  Future<void> _showTokenExpiredDialog(BuildContext context) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Token Expired',
      desc: 'Your session has expired. Please login again.',
      btnOkText: 'Login',
      btnOkOnPress: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      },
    ).show();
  }

  void clearData() {
    _customer = null;
    _accounts = [];
    _products = [];
    notifyListeners();
  }
}
