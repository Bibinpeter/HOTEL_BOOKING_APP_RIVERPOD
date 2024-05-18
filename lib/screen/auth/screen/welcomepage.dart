import 'dart:ui';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel/screen/auth/screen/login.dart';
import 'package:hotel/screen/auth/screen/register.dart';
import 'package:hotel/screen/widget/CoustomButton.dart';
import 'package:hotel/screen/widget/carouselWidget.dart';  

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<WelcomePage> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        _backgroundGradient(context),
        _foregroundWidget(context),
      ],
    );
  }

  Widget _backgroundGradient(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.35, 0.35],
          colors: [Colors.black.withOpacity(0.9), Colors.white],
        ),
      ),
    );
  }

  Widget _foregroundWidget(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _avatarImage(context),
              const SizedBox(height: 40),
              _infoContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.75,
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
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Image.asset(
                  "assets/images/pngwingall.png",
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
      height: MediaQuery.of(context).size.height * 0.59,
      width: MediaQuery.of(context).size.width * 0.90,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _infoText(context),
          const carouselWidget(),
          const SizedBox(height: 15),
          ActionSlider.standard(
           
            toggleColor: Colors.black,
            successIcon: Icon(Icons.check,color: Colors.white,),
            icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                    child: const Text('Slide to LOGIN '),
                    action: (controller) async {
                      controller.loading(); 
                      await Future.delayed(const Duration(seconds: 2));
                      controller.success();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>Login(),
                        ),
                         
                      );
          
                    }
          ),
          const SizedBox(height: 15),
          ElevatedButtonWidget(
            buttonText: " REGISTER ",
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _infoText(BuildContext context) {
    return const Column(
      children: [
        Text(
          "DIVE INTO HOTELS THAT\nMAKES YOUR JUORNEY HAPPY",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}


