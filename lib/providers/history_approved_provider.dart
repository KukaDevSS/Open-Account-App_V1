import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/personal_info.dart';
import 'package:flutter_app_1/models/account_info.dart';
import 'package:flutter_app_1/services/http_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryApprovedProvider with ChangeNotifier {

  final String _historyApprovedUrl = HistoryApiUrls.historyApprovedUrl;

  List<Map<String, dynamic>> _historyList = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get historyList => _historyList;
  bool get isLoading => _isLoading;

  Future<void> fetchHistory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_historyApprovedUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        print("Raw response data: $data"); 
        
        _historyList = data.map((item) {
          final personalInfo = PersonalInfo.fromJson(item);
          final accountInfo = item['accounts'] != null && item['accounts'].isNotEmpty
              ? AccountInfo.fromJson(item['accounts'][0])
              : null;
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
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
