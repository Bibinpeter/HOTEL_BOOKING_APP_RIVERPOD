import 'package:flutter/material.dart';
import 'package:hotel/screen/auth/screen/login.dart';
import 'package:hotel/screen/auth/service/auth_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key); // Fixed the super constructor

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           AuthService().signOut();   
           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);
          },
          child: Text('Click me'), // Add text to the button
        ),
      ),
    );
  }
}
