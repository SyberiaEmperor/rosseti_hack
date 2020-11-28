import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Point {
  final String caption;
  final bool noData;
  final LatLng position;
  const Point(
      {this.caption = "", @required this.position, this.noData = false});
}
