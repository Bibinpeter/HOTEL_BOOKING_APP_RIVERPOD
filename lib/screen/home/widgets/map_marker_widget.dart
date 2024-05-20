import 'package:flutter/material.dart';

 

class MapMarkerPrice extends StatelessWidget {
  const MapMarkerPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Align(      
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_drop_down,
              color:Colors.black,
              size: 50,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 28),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                 color:Colors.blue,
                borderRadius: BorderRadius.circular(8)),
            child:Text(
              price,
             style: const TextStyle(fontSize: 18,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}