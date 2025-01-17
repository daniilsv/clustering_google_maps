import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geohash/geohash.dart';

class LatLngAndGeohash {
  final LatLng location;
  final dynamic content;
  String geohash;

  LatLngAndGeohash(this.location, [this.content]) {
    geohash = Geohash.encode(location.latitude, location.longitude);
  }

  LatLngAndGeohash.fromMap(Map<String, dynamic> map)
      : location = LatLng(map['lat'], map['long']),
        content = null {
    this.geohash = Geohash.encode(this.location.latitude, this.location.longitude);
  }

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_${Random().nextInt(10000)}";
  }
}
