import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/customer_provider.dart';
import 'package:flutter_app_1/providers/history_approved_provider.dart';
import 'package:flutter_app_1/providers/history_processing_provider.dart';
import 'package:flutter_app_1/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_1/providers/account_provider.dart';
import 'package:flutter_app_1/routes/app_routes.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProcessingProvider()),
        ChangeNotifierProvider(create: (_) => HistoryApprovedProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
