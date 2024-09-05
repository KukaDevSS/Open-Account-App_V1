// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/product_info.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຂໍ້ມູນຜະລິດຕະພັນ'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              size: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              '${product.pdCode} Screen',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
