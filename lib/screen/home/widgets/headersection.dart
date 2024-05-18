import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel/screen/home/widgets/CustomIcon.dart';

class Headersection extends StatelessWidget {
  const Headersection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/photo.png"),
            ),
            const Spacer(),
            CustomIconWidget(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        ),
        Text(
          "Welcome back 👋",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        )
      ],
    );
  }
}