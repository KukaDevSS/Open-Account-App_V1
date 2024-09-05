class UserApiUrls {
  static const String baseUrl = 'http://10.2.182.7:8080/API/user';
  static const String imageBaseUrl = 'http://10.1.2.11:8089/Images/';
  static const String loginUrl = '$baseUrl/login';
  static const String registerUrl = '$baseUrl/register';
}

class HistoryApiUrls {
  static const String baseUrl = 'http://10.2.183.30:5000/api/v1/services';
  static const String historyProcessingUrl = '$baseUrl/history-processing';
  static const String historyApprovedUrl = '$baseUrl/history-approved';
}

class CustomerApiUrls {
  static const String baseUrl = 'http://10.2.182.7:8080/API/transaction';
  static const String searchCustomerUrl = '$baseUrl';
  static const String getProductsUrl = '$baseUrl/product';
}

class OpenAccountApiUrls {
  static const String baseUrl = 'http://10.2.183.30:5000/api/v1';
  static const String openAccountUrl = '$baseUrl/open-account';
}

class ApiHeaders {
  static Map<String, String> getCommonHeaders({String? token}) {
    final headers = {
      'accept': 'application/json',
      'x-api-key': 'LVB-2024-ONLINE',
      'Content-Type': 'application/json; charset=utf-8',
    };
    if (token != null) {
      headers['x-token'] = token;
    }
    return headers;
  }
}

