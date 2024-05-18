// ignore: file_names
import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final Function()? onPressed;
  final double size;
  const CustomIconWidget({
    required this.icon,
    super.key,
     this.onPressed,
        this.size=50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: IconButton(onPressed: onPressed,
       icon:icon),
    );
  }
}