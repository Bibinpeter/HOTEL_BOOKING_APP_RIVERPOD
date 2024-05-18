import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel/auth/screen/welcomepage.dart';
import 'package:hotel/screen/home/home.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Color.fromARGB(255, 246, 244, 244),
      Color.fromARGB(255, 50, 51, 51),
      Color.fromARGB(255, 43, 43, 42),
      Color.fromARGB(255, 75, 75, 75),
    ];
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: LottieBuilder.asset(
                'assets/animation/animation.json',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'GRAB YOUR OWN',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  colors: colorizeColors,
                ),
                ColorizeAnimatedText(
                  'SPACE ANYWHERE',
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  colors: colorizeColors,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      nextScreen: FirebaseAuth.instance.currentUser == null
          ? const WelcomePage()
          : const Homepage(),
      splashIconSize: 500,
      duration: 4500,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
