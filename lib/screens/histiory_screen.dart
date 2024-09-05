// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/history_approved.dart';
import 'package:flutter_app_1/widgets/history_processing.dart';
// import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ປະຫວັດ'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          bottom: TabBar(
            labelStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            tabs: [
              Tab(
                text: 'ກຳລັງດຳເນີນການ',
              ),
              Tab(text: 'ອະນຸມັດສຳເລັດ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HistoryProcessing(),
            HistoryApproved(),
          ],
        ),
      ),
    );
  }
}
