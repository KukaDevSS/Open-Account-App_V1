// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/product_info.dart';
import 'package:flutter_app_1/screens/productDetail_screen.dart';

class ProductListMenu extends StatelessWidget {
  final Product product;

  const ProductListMenu({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    IconData getIconForProduct(String pdCode) {
      switch (pdCode) {
        case 'ACC':
          return Icons.account_balance;
        case 'DIGI':
          return Icons.devices;
        case 'LSMS':
          return Icons.sms;
        case 'ATM':
          return Icons.atm;
        default:
          return Icons.live_help_outlined;
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(getIconForProduct(product.pdCode),
                color: Colors.blue, size: 40),
          ),
          SizedBox(height: 5),
          Text(
            product.pdCode,
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
