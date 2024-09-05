import 'package:flutter_app_1/models/address_info.dart';

class PersonalInfo {
  String title;
  String fullName;
  String idType;
  String idOrPassportNo;
  // String familyBookNo;
  DateTime dateOfBirth;
  Address registeredAddress;
  String phoneNumber;
  String idImage;

  PersonalInfo({
    required this.title,
    required this.fullName,
    required this.idType,
    required this.idOrPassportNo,
    // required this.familyBookNo,
    required this.dateOfBirth,
    required this.registeredAddress,
    required this.phoneNumber,
    required this.idImage,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      title: json['title'],
      fullName: json['fullName'],
      idType: json['idType'],
      idOrPassportNo: json['idOrPassportNo'],
      // familyBookNo: json['familyBookNo'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      registeredAddress: Address.fromJson(json['registeredAddress']),
      phoneNumber: json['phoneNumber'],
      idImage: json['id_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'fullName': fullName,
      'idType': idType,
      'idOrPassportNo': idOrPassportNo,
      // 'familyBookNo': familyBookNo,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'registeredAddress': registeredAddress.toJson(),
      'phoneNumber': phoneNumber,
      'id_image': idImage,
    };
  }
}
