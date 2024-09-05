class Address {
  String village;
  String district;
  String province;
  String country;

  Address({
    required this.village,
    required this.district,
    required this.province,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      village: json['village'],
      district: json['district'],
      province: json['province'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'village': village,
      'district': district,
      'province': province,
      'country': country,
    };
  }
}
