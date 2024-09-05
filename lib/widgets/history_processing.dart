// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/history_processing_provider.dart';
import 'package:provider/provider.dart';

class HistoryProcessing extends StatefulWidget {
  const HistoryProcessing({super.key});

  @override
  State<HistoryProcessing> createState() => _HistoryProcessingState();
}

class _HistoryProcessingState extends State<HistoryProcessing> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryProcessingProvider()..fetchHistory(),
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
                child: Consumer<HistoryProcessingProvider>(
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
                            print('Personal Info: $personalInfo');
                            print('Account Info: $accountInfo');
                            Navigator.pushNamed(
                              context,
                              '/processing_details',
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(8)),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                leading: Icon(
                                  Icons.pending_outlined,
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
                                          SizedBox(width: 5),
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
                                          // color: Colors.yellowAccent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 0),
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.pending_actions_rounded,
                                              color: Colors.yellow[700],
                                            ),
                                            Text(
                                              '${accountInfo?.accountStatus ?? 'N/A'}',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow[700]),
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
                                        SizedBox(height: 5),
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
