import 'package:flutter/material.dart';
import 'package:hotel/screen/home/widgets/CustomIcon.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key); // Fixed the super constructor

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: Size.height * 0.25),
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                children: [
                  _Headersection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Headersection extends StatelessWidget {
  const _Headersection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/photo.png"),
            ),
          Spacer(),
            CustomIconWidget(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
