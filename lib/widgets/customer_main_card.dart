// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/customer_provider.dart';
import 'package:provider/provider.dart';

class CustomerMainCard extends StatelessWidget {
  const CustomerMainCard({super.key, required this.accountName, required this.custNo, required this.branchCode});
  final String accountName;
  final String custNo;
  final String branchCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22),
      height: 180,
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
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('assets/images/dokmai.png',
                        width: 35, height: 35),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () async {
                    final provider = Provider.of<CustomerProvider>(context, listen: false);
                    await provider.getCustomerAndAccounts(custNo, context);
                    Navigator.pushNamed(context, '/customer_details');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  )),
            ],
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text( accountName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))),
              SizedBox(height: 10),
              Text(
                custNo,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      branchCode,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('assets/images/dokmai.png',
                        width: 35, height: 35),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
