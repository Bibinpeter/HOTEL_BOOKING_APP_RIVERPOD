import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        backgroundColor: Colors.black,  
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:90),
        child: Text(buttonText,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
