 


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel/screen/home/widgets/custommarkergenerator.dart';

class CustomMap extends StatefulWidget {
  final CameraPosition initialCameraPosition;
  final List<MarkerWidget> markerWidgets;
  final Function(GoogleMapController)? onMapCreated;

  const CustomMap({
    super.key,
    required this.initialCameraPosition,
    required this.markerWidgets,
    this.onMapCreated,
  });

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  Set<Marker> markers = {};
  List<GlobalKey> globalKeys = [];
  bool areMarkersGenerated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.markerWidgets.isNotEmpty)
          CustomMarkerGenerator(
            markerWidgets: widget.markerWidgets,
            callbackAction: (customMarkers) {
              setState(
                () {
                  markers = customMarkers.toSet();
                  areMarkersGenerated = true;
                },
              );
            },
          ),
        areMarkersGenerated
            ? GoogleMap(
                myLocationButtonEnabled: true,
                initialCameraPosition: widget.initialCameraPosition,
                onMapCreated: widget.onMapCreated,
                markers: markers,
              )
            : const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}