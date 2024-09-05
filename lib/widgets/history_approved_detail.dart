import 'package:flutter/material.dart';

class HistoryApprovedDetail extends StatelessWidget {
  const HistoryApprovedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Detail'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}