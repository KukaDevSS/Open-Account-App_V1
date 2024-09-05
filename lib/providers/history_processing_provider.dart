import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/personal_info.dart';
import 'package:flutter_app_1/models/account_info.dart';
import 'package:flutter_app_1/services/http_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryProcessingProvider with ChangeNotifier {
  final String _historyProcessingUrl = HistoryApiUrls.historyProcessingUrl;

  List<Map<String, dynamic>> _historyList = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get historyList => _historyList;
  bool get isLoading => _isLoading;

  Future<void> fetchHistory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_historyProcessingUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        print("Raw response data: $data");

        _historyList = data.map((item) {
          final personalInfoJson = item ?? {};
          final accountInfoJson =
              (item['accounts'] != null && item['accounts'].isNotEmpty)
                  ? item['accounts'][0]
                  : {};

          PersonalInfo? personalInfo;
          AccountInfo? accountInfo;

          try {
            personalInfo = PersonalInfo.fromJson(personalInfoJson);
          } catch (e) {
            print('Error parsing PersonalInfo: $e');
          }

          try {
            accountInfo = accountInfoJson.isNotEmpty
                ? AccountInfo.fromJson(accountInfoJson)
                : null;
          } catch (e) {
            print('Error parsing AccountInfo: $e');
          }

          return {
            'personalInfo': personalInfo,
            'accountInfo': accountInfo,
          };
        }).toList();

        print("Fetched history: $_historyList");
      } else {
        print('Failed to load history');
      }
    } catch (error) {
      print('Error fetching history: $error');
      // throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
