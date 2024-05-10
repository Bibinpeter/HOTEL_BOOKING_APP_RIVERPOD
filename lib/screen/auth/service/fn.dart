
import 'package:flutter/material.dart';
import 'package:hotel/screen/auth/screen/login.dart';
import 'package:hotel/screen/home/home.dart';
 

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Color.fromARGB(255, 224, 221, 221), 
  fontWeight: FontWeight.w300),
    
  focusedBorder: UnderlineInputBorder(  
    borderSide: BorderSide(color: Color.fromARGB(255, 100, 238, 187), width: 2),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0), width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
}

void nextScreenReplace(context, page, userId) {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>   const Homepage()),(Route)=>true);
}

