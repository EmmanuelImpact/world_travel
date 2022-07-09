import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String? address;

  PlaceLocation(
      {required this.longitude, required this.latitude, this.address});
}

class Place {
  final String title;
  final String id;
  final File image;
  final PlaceLocation location;

  Place(
      {required this.title,
      required this.id,
      required this.image,
      required this.location});
}
