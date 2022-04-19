import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
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
    DBHelper.insertData('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchPlaces() async {
    final places = await DBHelper.fetchData('user_places');
    _places = places
        .map(
          (p) => Place(
              id: p['id'],
              title: p['title'],
              image: File(p['image']),
              location: PlaceLocation(latitude: 0.0, longitude: 0.0)),
        )
        .toList();
    notifyListeners();
  }
}
