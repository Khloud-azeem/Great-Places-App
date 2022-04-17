import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places]; //copy of the places outside
  }
}
