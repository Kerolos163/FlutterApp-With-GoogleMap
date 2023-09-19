import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/Core/Utils/LocationHelper.dart';
import 'package:flutter_maps/Core/Utils/mycolor.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatefulWidget {
  MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  static Position? position;
  static final CameraPosition myCurrentCameraLocation = CameraPosition(
    bearing: 0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0,
    zoom: 17,
  );

  Future<void> getCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(myCurrentCameraLocation));
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: myCurrentCameraLocation,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        _mapController.complete(controller);
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: position != null
          ? buildMap()
          : const Center(
              child: CircularProgressIndicator(
                color: MyColors.blue,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToMyCurrentLocation,
        child: const Icon(Icons.place),
      ),
    );
  }
}
