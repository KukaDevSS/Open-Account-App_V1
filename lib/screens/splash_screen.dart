// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'search_user_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      _checkRegistrationStatus(context);
    });

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Image(image: AssetImage('assets/images/splash-logo.png'),width: 300,),
      ),
    );
  }

  void _checkRegistrationStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    final isRegistered = prefs.getBool('isRegistered') ?? false;

    if (isRegistered) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SearchUserScreen()),
      );
    }
  }
}
