import 'package:geolocator/geolocator.dart';

//CLAIM : codes here mostly from pub.dev website (gelocator plugins)
class GeolocatorService {
  //instance of geolocater
  final Geolocator geo = Geolocator();

  //live user position - that follow us around
  Stream<Position> getCurrentLocation() {
    //every 10 meters the apps will throw an event
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    return geo.getPositionStream(locationOptions);
  }

  //to get your current position
  Future<Position> getInitialLocation() async {
    return geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
