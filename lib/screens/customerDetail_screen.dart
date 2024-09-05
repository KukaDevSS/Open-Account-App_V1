// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_1/providers/customer_provider.dart';

class CustomerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerProvider>(context);
    if (provider.customer == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Customer Details'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        body: Center(child: Text('No customer data available')),
      );
    }

    final customer = provider.customer!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ຂໍ້ມູນລູກຄ້າ'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[900]!),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('${customer.customerName}', 
                  style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CIF CREATION DATE', style: TextStyle(fontSize: 16,)),
                  Text('${customer.cifCreationDate}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CUSTOMER TYPE', style: TextStyle(fontSize: 16,)),
                  Text('${customer.customerType}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ADDRESS LINE', style: TextStyle(fontSize: 16,)),
                  Text('${customer.addressLine1}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('COUNTRY', style: TextStyle(fontSize: 16,)),
                  Text('${customer.country}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SHORT NAME', style: TextStyle(fontSize: 16,)),
                  Text('${customer.shortName}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('NATIONALITY', style: TextStyle(fontSize: 16,)),
                  Text('${customer.nationality}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('LANGUAGE', style: TextStyle(fontSize: 16,)),
                  Text('${customer.language}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('LOCAL BRANCH', style: TextStyle(fontSize: 16,)),
                  Text('${customer.localBranch}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MAKER ID', style: TextStyle(fontSize: 16,)),
                  Text('${customer.makerId}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MAKER DT STAMP', style: TextStyle(fontSize: 16,)),
                  Text('${customer.makerDtStamp}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CHECKER ID', style: TextStyle(fontSize: 16,)),
                  Text('${customer.checkerId}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('CHECKER DT STAMP', style: TextStyle(fontSize: 16,)),
                  Text('${customer.checkerDtStamp}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ONCE AUTH', style: TextStyle(fontSize: 16,)),
                  Text('${customer.onceAuth}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('UNIQUE ID NAME', style: TextStyle(fontSize: 16,)),
                  Text('${customer.uniqueIdName}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('UNIQUE ID VALUE', style: TextStyle(fontSize: 16,)),
                  Text('${customer.uniqueIdValue}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('RECORD STATUS', style: TextStyle(fontSize: 16,)),
                  Text('${customer.recordStat}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('AUTH STATUS', style: TextStyle(fontSize: 16,)),
                  Text('${customer.authStat}', style: TextStyle(fontSize: 16,color: Colors.blue[700], fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
