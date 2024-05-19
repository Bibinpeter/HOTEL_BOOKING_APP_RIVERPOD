import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel/provider/map_location_provider.dart';
import 'package:hotel/provider/map_markers_provider.dart';
import 'package:hotel/provider/selected_hotel_provider.dart';
import 'package:hotel/screen/home/nav_bar.dart';
import 'package:hotel/screen/home/widgets/custommap.dart';
import 'package:hotel/screen/home/widgets/hotelcard.dart';

class MapPage extends ConsumerWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapLocation = ref.watch(mapLocationProvider);
    final mapMarkers = ref.watch(mapMarkersProvider);
    final selectedHotel = ref.watch(selectedHotelProvider);

    return Scaffold(
      bottomNavigationBar: CustomNavBar(index: 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: mapMarkers.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (markers) {
          return Stack(
            children: [
              CustomMap(
                initialCameraPosition: CameraPosition(
                  target: mapLocation,
                  zoom: 12.5,
                ),
                markerWidgets: markers.toList(),
              ),
              selectedHotel.maybeWhen(
                data: (hotel) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: HotelCard(hotel: hotel),
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }
}
