import 'dart:async';
import 'dart:io';

import '../models/point.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:translator/translator.dart';

Geolocator geolocator = new Geolocator();

class Geo {
  static Future<String> getRussinAddress(Placemark place) async {
    String subAdmin = place.administrativeArea;
    String tf = place.thoroughfare;
    String name = place.name;

    final translator = GoogleTranslator();

    subAdmin =
        (await translator.translate(subAdmin, from: 'en', to: 'ru')).text;
    tf = (await translator.translate(tf, from: 'en', to: 'ru')).text;
    name = (await translator.translate(name, from: 'en', to: 'ru')).text;

    return subAdmin + " " + tf + " " + name;
  }

  static Future<Point> getAddressFromLatLng(LatLng pos) async {
    List<Placemark> p =
        await geolocator.placemarkFromCoordinates(pos.latitude, pos.longitude);

    Placemark place = p[0];
    return new Point(
        caption: Platform.isAndroid
            ? " ${place.subAdministrativeArea}, ${place.thoroughfare}, ${place.name}"
            : " ${place.subAdministrativeArea}, ${place.name}",
        position: pos);
  }

//возвращает null, если геопозицию получить нельзя
  static Future<Point> getAddress() async {
    location.LocationData currentLocation;
    List<Placemark> placemarks;
    var loc = location.Location();
    try {
      var status = await location.Location().requestPermission();
      if (status != location.PermissionStatus.deniedForever &&
          status != location.PermissionStatus.denied &&
          await Geolocator().isLocationServiceEnabled()) {
        currentLocation =
            await loc.getLocation().timeout(Duration(seconds: 15));
        var position = Position(
          accuracy: currentLocation.accuracy,
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
        );
        placemarks = await geolocator
            .placemarkFromPosition(position)
            .timeout(Duration(seconds: 15));
      } else
        return null;
      Placemark place = placemarks[0];

      return new Point(
          caption: Platform.isAndroid
              ? " ${place.subAdministrativeArea}, ${place.thoroughfare}, ${place.name}"
              : " ${place.subAdministrativeArea}, ${place.name}",
          position:
              new LatLng(place.position.latitude, place.position.longitude));
    } on TimeoutException {
      return new Point(
          caption: "Не удалось получить данные",
          position: LatLng(0.0, 0.0),
          noData: true);
    } on Exception {
      return null;
    }
  }
}
