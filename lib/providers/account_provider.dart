import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/account_info.dart';
import 'package:flutter_app_1/models/personal_info.dart';
import 'package:flutter_app_1/services/http_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AccountProvider with ChangeNotifier {
  final String _accountUrl = OpenAccountApiUrls.baseUrl;

  Future<void> sendAccountData(PersonalInfo personalInfo,
      AccountInfo accountInfo, File? image, BuildContext context) async {
    final url = Uri.parse('$_accountUrl/services/open-account');

    try {
      var request;

      if (image != null) {
        request = http.MultipartRequest('POST', url);
        final mimeType = lookupMimeType(image.path);
        if (mimeType != null) {
          final mimeTypeData = mimeType.split('/');
          request.files.add(await http.MultipartFile.fromPath(
            'id_image',
            image.path,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
          ));
        } else {
          throw Exception('MimeType is null');
        }
      } else {
        request = http.Request('POST', url);
        request.headers['Content-Type'] = 'application/json';
      }

      request.fields['PersonalInfo'] = json.encode(personalInfo.toJson());
      request.fields['AccountInfo'] = json.encode(accountInfo.toJson());

      print('Sending request...');

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print('Response received: ${response.statusCode}');

      if (response.statusCode == 201) {
        await _showSuccessDialog(context);
      } else {
        String errorMessage = 'Error: ${response.statusCode}';

        if (response.body.isNotEmpty) {
          try {
            final errorJson = json.decode(response.body);
            errorMessage +=
                '\n${errorJson['message'] ?? 'No additional information'}';
          } catch (error) {
            errorMessage += '\nUnable to parse error details.';
          }
        } else {
          errorMessage += '\nNo additional error information.';
        }

        await _showErrorDialog(context, errorMessage);
      }
    } catch (error) {
      print('Exception occurred: $error');
      await _showErrorDialog(context, 'An error occurred while sending data');
    }
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'ສຳເລັດແລ້ວ',
      desc: 'ບັນຊີຖືກສ້າງຂຶ້ນສໍາເລັດ',
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }

  Future<void> _showErrorDialog(
      BuildContext context, String errorMessage) async {
    await AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: 'ບໍ່ສໍາເລັດ',
      desc: errorMessage,
    ).show();
  }
}
