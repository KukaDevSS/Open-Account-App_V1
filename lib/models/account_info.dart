// class AccountInfo {
//   String accountName;
//   String accountType;
//   String typeOfOwnership;
//   String currency;
//   String accountStatus;
//   String created_at;
//   String created_by;

//   AccountInfo({
//     required this.accountName,
//     required this.accountType,
//     required this.typeOfOwnership,
//     required this.currency,
//     required this.accountStatus,
//     required this.created_at,
//     required this.created_by,
//     // required this.signatureImage,
//   });

//   factory AccountInfo.fromJson(Map<String, dynamic> json) {
//     return AccountInfo(
//       accountName: json['accountName'],
//       accountType: json['accountType'],
//       typeOfOwnership: json['typeOfOwnership'],
//       currency: json['currency'],
//       accountStatus: json['accountStatus'],
//       created_at: json['created_at'],
//       created_by: json['created_by'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'accountName': accountName,
//       'accountType': accountType,
//       'typeOfOwnership': typeOfOwnership,
//       'currency': currency,
//       'accountStatus': accountStatus,
//       'createBy': created_by,
//     };
//   }
// }


class AccountInfo {
  String? accountName;
  String? accountType;
  String? typeOfOwnership;
  String? currency;
  String? accountStatus;
  String? created_at;
  String? created_by;


  AccountInfo({
    this.accountName,
    this.accountType,
    this.typeOfOwnership,
    this.currency,
    this.accountStatus,
    this.created_at,
    this.created_by,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      accountName: json['accountName'] as String?,
      accountType: json['accountType'] as String?,
      typeOfOwnership: json['typeOfOwnership'] as String?,
      currency: json['currency'] as String?,
      accountStatus: json['accountStatus'] as String?,
      created_at: json['created_at'] as String?,
      created_by: json['created_by'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountName': accountName,
      'accountType': accountType,
      'typeOfOwnership': typeOfOwnership,
      'currency': currency,
      'accountStatus': accountStatus,
      'created_at': created_at,
      'created_by': created_by,
    };
  }
}

