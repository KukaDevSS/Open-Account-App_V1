class CustomerAccount {
  final int rowNum;
  final String branchCode;
  final String custAcNo;
  final String accountClass;
  final String acDesc;
  final String custNo;
  final String ccy;
  final String acOpenDate;
  final String recordStat;
  final String authStat;
  final String makerId;
  final String makerDtStamp;
  final String checkerId;
  final String checkerDtStamp;
  final String statusSince;
  final String dateLastDr;
  final String dateLastCr;

  CustomerAccount({
    required this.rowNum,
    required this.branchCode,
    required this.custAcNo,
    required this.accountClass,
    required this.acDesc,
    required this.custNo,
    required this.ccy,
    required this.acOpenDate,
    required this.recordStat,
    required this.authStat,
    required this.makerId,
    required this.makerDtStamp,
    required this.checkerId,
    required this.checkerDtStamp,
    required this.statusSince,
    required this.dateLastDr,
    required this.dateLastCr,
  });

  factory CustomerAccount.fromJson(Map<String, dynamic> json) {
    return CustomerAccount(
      rowNum: json['ROWNUM'],
      branchCode: json['BRANCH_CODE'],
      custAcNo: json['CUST_AC_NO'],
      accountClass: json['ACCOUNT_CLASS'],
      acDesc: json['AC_DESC'],
      custNo: json['CUST_NO'],
      ccy: json['CCY'],
      acOpenDate: json['AC_OPEN_DATE'],
      recordStat: json['RECORD_STAT'],
      authStat: json['AUTH_STAT'],
      makerId: json['MAKER_ID'],
      makerDtStamp: json['MAKER_DT_STAMP'],
      checkerId: json['CHECKER_ID'],
      checkerDtStamp: json['CHECKER_DT_STAMP'],
      statusSince: json['STATUS_SINCE'],
      dateLastDr: json['DATE_LAST_DR'],
      dateLastCr: json['DATE_LAST_CR'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ROWNUM': rowNum,
      'BRANCH_CODE': branchCode,
      'CUST_AC_NO': custAcNo,
      'ACCOUNT_CLASS': accountClass,
      'AC_DESC': acDesc,
      'CUST_NO': custNo,
      'CCY': ccy,
      'AC_OPEN_DATE': acOpenDate,
      'RECORD_STAT': recordStat,
      'AUTH_STAT': authStat,
      'MAKER_ID': makerId,
      'MAKER_DT_STAMP': makerDtStamp,
      'CHECKER_ID': checkerId,
      'CHECKER_DT_STAMP': checkerDtStamp,
      'STATUS_SINCE': statusSince,
      'DATE_LAST_DR': dateLastDr,
      'DATE_LAST_CR': dateLastCr,
    };
  }
}
