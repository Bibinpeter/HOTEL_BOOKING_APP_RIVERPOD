import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Searchlottie extends StatelessWidget {
  const Searchlottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LottieBuilder.asset(
          'assets/animation/animation.json',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
