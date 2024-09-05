// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HistoryProcessingDetail extends StatelessWidget {
  const HistoryProcessingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Detail'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}


