import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyAIsAwNddsmcDjfiu0CMgmeuJXYxUJtR84';

class LocationHelper {
  static String getLocationPreviewImg(
      {required double longitude, required double latitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlacaAddress(double latitude, double longitude) async{
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY";
    final response = await http.get(Uri.parse(url));
    final address = json.decode(response.body)['results'][0]['formatted_address'];
    return address;
  }
}
