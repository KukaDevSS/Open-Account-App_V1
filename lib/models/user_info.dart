class User {
  final int empId;
  final String userAd;
  final String empName;
  final String mobile;
  final String position;
  final String branchCode;
  final String branchName;
  final String depCode;
  final String depName;
  final String email;
  final String birthday;
  final String picture;

  User({
    required this.empId,
    required this.userAd,
    required this.empName,
    required this.mobile,
    required this.position,
    required this.branchCode,
    required this.branchName,
    required this.depCode,
    required this.depName,
    required this.email,
    required this.birthday,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      empId: json['EMPID'],
      userAd: json['USERAD'],
      empName: json['EMPNAME'],
      mobile: json['MOBILE'],
      position: json['POSITION'],
      branchCode: json['BRANCH_CODE'],
      branchName: json['BRANCH_NAME'],
      depCode: json['DEP_CODE'],
      depName: json['DEP_NAME'],
      email: json['EMAIL'],
      birthday: json['BIRTHDAY'],
      picture: json['PICTURE'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'EMPID': empId,
      'USERAD': userAd,
      'EMPNAME': empName,
      'MOBILE': mobile,
      'POSITION': position,
      'BRANCH_CODE': branchCode,
      'BRANCH_NAME': branchName,
      'DEP_CODE': depCode,
      'DEP_NAME': depName,
      'EMAIL': email,
      'BIRTHDAY': birthday,
      'PICTURE': picture,
    };
  }
}
