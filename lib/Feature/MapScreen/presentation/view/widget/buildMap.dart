import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuildMap extends StatelessWidget {
  const BuildMap({super.key, required this.myCurrentCameraLocation, required this.mapController});
final CameraPosition myCurrentCameraLocation;
final Completer<GoogleMapController> mapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: myCurrentCameraLocation,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        mapController.complete(controller);
      },
    );
  }
}