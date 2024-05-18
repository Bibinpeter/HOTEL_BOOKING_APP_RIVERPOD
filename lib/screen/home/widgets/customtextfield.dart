import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final  TextEditingController controller;
  
  final String label;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
          controller: controller,
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(color: Colors.blueGrey),
          ),
          border: InputBorder.none),
    ));
  }
}