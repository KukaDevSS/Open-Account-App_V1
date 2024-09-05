// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomerAccountList extends StatelessWidget {
  const CustomerAccountList({super.key, required this.accountNumber, required this.ccy, required this.branchCode, required this.openDate, required this.accountName});
  final String accountName;
  final String accountNumber;
  final String ccy;
  final String branchCode;
  final String openDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              accountName,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  accountNumber,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ccy,
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Colors.grey[200]!, width: 1.0), // Top border
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      openDate,
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    Text(
                      branchCode,
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
