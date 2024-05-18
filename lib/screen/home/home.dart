import 'package:flutter/material.dart';
import 'package:hotel/screen/home/widgets/Searchcard.dart';
import 'package:hotel/screen/home/widgets/headersection.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

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
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Headersection(),
                  SearchCard(),
                  NearbyHotels(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class NearbyHotels extends StatelessWidget {
  const NearbyHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}