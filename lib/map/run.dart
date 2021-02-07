import 'package:getmecar_admin/map/services/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'screens/map.dart';

class MapOne extends StatelessWidget {
  final geoService = GeolocatorService();

  MapOne();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialLocation(),
      child: MaterialApp(
        title: 'Flutter Map',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //call map.dart inside screens
        home: Consumer<Position>(
          builder: (context, position, widget) {
            //make the screen move with you and you are still in center
            return (position != null)
                ? Map(position)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
