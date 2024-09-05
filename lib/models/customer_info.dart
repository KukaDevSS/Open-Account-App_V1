class Customer {
  final int rowNum;
  final String customerNo;
  final String cifCreationDate;
  final String customerType;
  final String customerName;
  final String addressLine1;
  final String country;
  final String shortName;
  final String nationality;
  final String language;
  final String localBranch;
  final String makerId;
  final String makerDtStamp;
  final String checkerId;
  final String checkerDtStamp;
  final String onceAuth;
  final String uniqueIdName;
  final String uniqueIdValue;
  final String recordStat;
  final String authStat;

  Customer({
    required this.rowNum,
    required this.customerNo,
    required this.cifCreationDate,
    required this.customerType,
    required this.customerName,
    required this.addressLine1,
    required this.country,
    required this.shortName,
    required this.nationality,
    required this.language,
    required this.localBranch,
    required this.makerId,
    required this.makerDtStamp,
    required this.checkerId,
    required this.checkerDtStamp,
    required this.onceAuth,
    required this.uniqueIdName,
    required this.uniqueIdValue,
    required this.recordStat,
    required this.authStat,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      rowNum: json['ROWNUM'],
      customerNo: json['CUSTOMER_NO'],
      cifCreationDate: json['CIF_CREATION_DATE'],
      customerType: json['CUSTOMER_TYPE'],
      customerName: json['CUSTOMER_NAME'],
      addressLine1: json['ADDRESS_LINE1'],
      country: json['COUNTRY'],
      shortName: json['SHORT_NAME'],
      nationality: json['NATIONALITY'],
      language: json['LANGUAGE'],
      localBranch: json['LOCAL_BRANCH'],
      makerId: json['MAKER_ID'],
      makerDtStamp: json['MAKER_DT_STAMP'],
      checkerId: json['CHECKER_ID'],
      checkerDtStamp: json['CHECKER_DT_STAMP'],
      onceAuth: json['ONCE_AUTH'],
      uniqueIdName: json['UNIQUE_ID_NAME'],
      uniqueIdValue: json['UNIQUE_ID_VALUE'],
      recordStat: json['RECORD_STAT'],
      authStat: json['AUTH_STAT'],
    );
  }
}
