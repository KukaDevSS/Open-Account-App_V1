import 'package:flutter/material.dart';

class InformationAvailable extends StatelessWidget {
  const InformationAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Customer Not Found')
          ],
        ),
      )
    );
  }
}