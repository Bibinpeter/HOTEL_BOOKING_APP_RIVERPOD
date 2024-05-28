import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel/gen/assets.gen.dart';
import 'package:hotel/model/model.dart';
import 'package:hotel/screen/home/widgets/CustomElevated.dart';

 

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              hotel.thumbnailPath,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _HotelTitleSection(hotel: hotel),
                        const SizedBox(height: 16),
                        const _FacilitiesSection(),
                      ],
                    ),
                  ),
                  _GallerySection(imagePaths: hotel.imagePaths),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: _LocationSection(
                      hotel: hotel,
                      address: hotel.address,
                      coordinate: hotel.coordinate,
                      description: hotel.description,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: ()=> Navigator.of(context).pop(),
                     icon:const Icon(Icons.favorite,color: Colors.grey,))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _ReserveBar(price: hotel.price),
    );
  }
}

class _HotelTitleSection extends StatelessWidget {
  const _HotelTitleSection({
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.title,
          textAlign: TextAlign.left,
         
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(Icons.location_city),
            const SizedBox(width: 10),
            Text(hotel.location),
           
          ], 
        ),
        const SizedBox(height: 10),
         Text('Rating = ${hotel.ratingScore.toString()}'),
         Text('Total review = ${hotel.totalReview}'),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _FacilitiesSection extends StatelessWidget {
  const _FacilitiesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text('Facilities',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20), ),
        const SizedBox(height: 10),
        Table(
          columnWidths: const {0: FlexColumnWidth(), 1: FlexColumnWidth()},
          children: [
            TableRow(
              children: [
                _buildIconWithLabel(
                  Icons.star_border,
                  const Text("Five star "),
                ),
                _buildIconWithLabel(
                 Icons.room,
                  const Text('Room servie')
                ),
              ],
            ),
            TableRow(
              children: [
                _buildIconWithLabel(
                 Icons.wifi,
                const Text('free wifi')
                ),
                _buildIconWithLabel(
                 Icons.ac_unit,
                 const Text('Air condition')
                ),
              ],
            ),
            TableRow(
              children: [
                _buildIconWithLabel(
                  Icons.airplanemode_on,
                  const Text('Airport pickup')
                ),
                _buildIconWithLabel(
                  Icons.pool,
                  const Text('swimming pool')
                ),
              ],
            )
          ],
        ),  
      ],
    );
  }

  Padding _buildIconWithLabel(
    IconData icon,
    Text label,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          label
        ],
      ),
    );
  }
}

class _GallerySection extends StatelessWidget {
  const _GallerySection({
    required this.imagePaths,
  });

  final List<String> imagePaths;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         const Padding(
           padding:  EdgeInsets.symmetric(horizontal: 20),
           child: Text('Gallery', 
           style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ),
         ),
        const SizedBox(height: 5),
        SizedBox(
          height: 150,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              final imagePath = imagePaths[index];
              return AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LocationSection extends StatelessWidget {
  const _LocationSection({
    required this.address,
    required this.coordinate,
    required this.description, 
    required this.hotel,
  });

  final String address;
  final LatLng coordinate;
  final String description;
    final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(hotel.location,style: const TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
        Text(hotel.address,style: const TextStyle(fontWeight: FontWeight.normal),),
        const SizedBox(height: 10),
        FutureBuilder<BitmapDescriptor?>(
          future: _convertToMarkerBitmap(),
          builder: (context, snapshot) {
            final bitmapData = snapshot.data;
            if (bitmapData == null) {
              return const SizedBox.shrink();
            } else {
              return SizedBox(
                height: 200,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  initialCameraPosition:
                      CameraPosition(target: coordinate, zoom: 15),
                  markers: {
                    Marker(
                      markerId: MarkerId(address),
                      position: coordinate,
                      icon: bitmapData,
                    ),
                  },
                ),
              );
            }
          },
        ),
         const SizedBox(height: 10),
        Text(hotel.description,style: const TextStyle(fontWeight: FontWeight.normal),),
        const SizedBox(height: 10),        
      ],
    );
  }

  Future<BitmapDescriptor?> _convertToMarkerBitmap() async {
    final data = await rootBundle.load(Assets.images.toString());
    final uint8List = data.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(uint8List);
  }
}

class _ReserveBar extends StatelessWidget {
  const _ReserveBar({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(20.0).copyWith(top: 10.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text('Start from',),
              
            ],
          ),
          SizedBox(
            width: 150,
            child:  CustomElevatedButton(
              text: "back",
               color: Colors.black,
                fontSize: 18,
                 onPressed: ()=>Navigator.pop(context))
          ),
        ],
      ),
    );
  }
}