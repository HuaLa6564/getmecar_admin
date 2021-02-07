import 'dart:async';

import 'package:getmecar_admin/map/services/geolocator_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  final Position initialPostion;
  Map(this.initialPostion);
  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    geoService.getCurrentLocation().listen(
      (position) {
        centerScreen(position);
      },
    );

    super.initState();
  }

  //Display your map
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
              body: Center(
                  child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(2.1812, 102.4266), zoom: 8),
            //satellite display
            mapType: MapType.satellite,
            //show blue dot where you are
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          )));
        });
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  }
}
