import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LatLong extends StatefulWidget {
  @override
  _LatLongState createState() => _LatLongState();
}

class _LatLongState extends State<LatLong> {
  String latitudeData = "";
  String longitudeData = "";
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    final geoposition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeData = '${geoposition.latitude}';
      longitudeData = '${geoposition.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(latitudeData),
            Text(longitudeData),
          ],
        ));
  }
}
