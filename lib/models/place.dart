// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';

class PlaceLocation {
  final double longitude;
  final double latitude;
  final String? address;
  PlaceLocation(
      {required this.longitude, required this.latitude, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
