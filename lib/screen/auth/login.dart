import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        _backgroundGradient(
          context,
        ),
        _foregroundwidget(context),
      ],
    );
  }

  Widget _backgroundGradient(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.35, 0.35],
          colors: [Colors.black.withOpacity(0.9), Colors.white],
        ),
      ),
    );
  }

  Widget _foregroundwidget(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _avatharImage(context),
            const SizedBox(
              height: 40,
            ),
            _infoContainer(context),
          ],
        ),
      ),
    ));
  }

  Widget _avatharImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width * 0.75,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          0.1,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Image.asset(
                  "assets/images/pngwing.com (5).png",
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoContainer(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.59,
      width: MediaQuery.sizeOf(context).width * 0.90,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.04),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          _infoText(context),
        ],
      ),
    );
  }

  Widget _infoText(BuildContext context) {
    return Text(
      " FIND THE HOTELS THAT\nFITS YOUR WALLET HAPPY ",
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
    );
  }
}
