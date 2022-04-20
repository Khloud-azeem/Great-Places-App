import 'package:flutter/material.dart';

const GOOGLE_API_KEY = '';

class LocationHelper {
  static String getLocationPreviewImg(
      {required double longitude, required double latitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}