import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyStateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/animations/empty_state.json', // Path to your Lottie animation
        width: 200, // Adjust the size of the animation
        height: 200,
        fit: BoxFit.contain, // Adjust the fit
      ),
    );
  }
}
