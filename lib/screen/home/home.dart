import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel/model/model.dart';
import 'package:hotel/provider/all_hotels_provider.dart';
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.25),
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Headersection(),
                    SizedBox(height: 10,),
                    SearchCard(),
                    SizedBox( height: 10,),
                    NearbyHotels(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NearbyHotels extends ConsumerWidget {
  const NearbyHotels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotels = ref.watch(allHotelsProvider);
    return Column(
      children: [
        hotels.when(
          data: (hotels) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return HotelCard(hotel: hotels[index]);
              },
            );
          },
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class HotelCard extends StatelessWidget {
  final HotelModel hotel;

  const HotelCard({
    super.key,
    required this.hotel,
  }); 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withAlpha(50),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              child: Image.asset(
                hotel.thumbnailPath,
                fit: BoxFit.cover,
                width: 200,
                height: 150,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    hotel.title,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    hotel.location,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${hotel.price.toStringAsFixed(2)} per night',
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        hotel.ratingScore.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(${hotel.totalReview} reviews)',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
