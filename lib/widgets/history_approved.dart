// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/history_approved_provider.dart';
import 'package:provider/provider.dart';

class HistoryApproved extends StatefulWidget {
  const HistoryApproved({super.key});

  @override
  State<HistoryApproved> createState() => _HistoryApprovedState();
}

class _HistoryApprovedState extends State<HistoryApproved> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryApprovedProvider()..fetchHistory(),
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.05),
                  BlendMode.modulate,
                ),
                child: Image.asset('assets/images/dokmai.png'),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<HistoryApprovedProvider>(
                  builder: (context, historyProvider, child) {
                    if (historyProvider.isLoading) {
                      return CircularProgressIndicator();
                    }

                    if (historyProvider.historyList.isEmpty) {
                      return Text('No history available');
                    }

                    return ListView.builder(
                      itemCount: historyProvider.historyList.length,
                      itemBuilder: (context, index) {
                        final historyItem = historyProvider.historyList[index];
                        final personalInfo = historyItem['personalInfo'];
                        final accountInfo = historyItem['accountInfo'];

                        print('History Item: $historyItem');

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/approved_details');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                leading: Icon(
                                  Icons.check_circle_outline,
                                  size: 50,
                                  color: Colors.blue[900],
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            personalInfo?.title ?? 'No Name',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            personalInfo?.fullName ?? 'No Name',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: Row(
                                          children: [
                                            Icon(Icons.check_circle_outline, color: Colors.green,),
                                            Text(
                                              '${accountInfo?.accountStatus ?? 'N/A'}',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ID: ${personalInfo?.idOrPassportNo ?? 'N/A'}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'CREATED AT: ${accountInfo?.created_at ?? 'N/A'}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          'CREATE BY: ${accountInfo?.created_by ?? 'N/A'}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
