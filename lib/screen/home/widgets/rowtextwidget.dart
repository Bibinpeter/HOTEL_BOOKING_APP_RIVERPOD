import 'package:flutter/material.dart';

class RowtextWidget extends StatelessWidget {
  const RowtextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Near by Hotels",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          'See all',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}