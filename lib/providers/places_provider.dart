import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places]; //copy of the places outside
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: PlaceLocation(latitude: 0.0, longitude: 0.0));
    _places.add(newPlace);
    notifyListeners();
  }
}
