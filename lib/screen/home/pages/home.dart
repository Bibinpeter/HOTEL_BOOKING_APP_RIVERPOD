import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel/provider/all_hotels_provider.dart';
import 'package:hotel/screen/home/pages/nav_bar.dart';
import 'package:hotel/screen/home/widgets/Searchcard.dart';
import 'package:hotel/screen/home/widgets/headersection.dart';
import 'package:hotel/screen/home/widgets/hotelcard.dart';
import 'package:hotel/screen/home/widgets/rowtextwidget.dart';

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
                    SizedBox(
                      height: 10,
                    ),
                    SearchCard(),
                    SizedBox(
                      height: 10,
                    ),
                    RowtextWidget(),
                    NearbyHotels(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return CustomNavBar(index: 0);
        },
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
