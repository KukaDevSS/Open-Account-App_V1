class Product {
  final String pdCode;
  final int pdOrder;
  final String pdStatus;

  Product({
    required this.pdCode,
    required this.pdOrder,
    required this.pdStatus,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      pdCode: json['PD_CODE'],
      pdOrder: json['PD_ORDER'],
      pdStatus: json['PD_STATUS'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'PD_CODE': pdCode,
      'PD_ORDER': pdOrder,
      'PD_STATUS': pdStatus,
    };
  }
}
