import 'package:flutter/material.dart';

// ignore: camel_case_types
class profilecontainerWidget extends StatelessWidget {
  const profilecontainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.privacy_tip, color: Colors.black),
        SizedBox(width: 8.0),
        Text(
          'Privacy Policy',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ],
    );
  }
}