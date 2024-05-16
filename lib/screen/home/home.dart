import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key); // Fixed the super constructor

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("jjjj jjjjjjj jjjjjjjj"),
        backgroundColor: Colors.blueAccent,),
      body: Stack(children: [
        Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: Size.height*0.25),
          color: Colors.white,
        )
      ],),
    );
  }
} 
