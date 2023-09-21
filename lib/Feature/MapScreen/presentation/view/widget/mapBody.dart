import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../../Core/Utils/LocationHelper.dart';
import '../../../../../Core/Utils/mycolor.dart';
import 'BuildFloatingSearchBar.dart';
import 'buildMap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  FloatingSearchBarController? controller;
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

  @override
  void initState() {
    controller = FloatingSearchBarController();
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        position != null
            ? BuildMap(
                myCurrentCameraLocation: myCurrentCameraLocation,
                mapController: _mapController,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: MyColors.blue,
                ),
              ),
        FloatingSearchBarWidget(
          controller: controller,
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToMyCurrentLocation,
        child: const Icon(Icons.place),
      ),
    );
  }
}
