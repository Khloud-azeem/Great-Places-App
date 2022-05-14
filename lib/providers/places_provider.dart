import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places]; //copy of the places outside
  }

  Future<void> addPlace(
      String title, File image, PlaceLocation location) async {
    final address = await LocationHelper.getPlacaAddress(
        location.latitude, location.longitude);
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: image,
        title: title,
        location: PlaceLocation(
          latitude: location.latitude,
          longitude: location.longitude,
          address: address,
        ));
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insertData('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'latitude': newPlace.location.latitude,
      'longitude': newPlace.location.longitude,
      'address': newPlace.location.address as String,
    });
  }

  Future<void> fetchPlaces() async {
    final placesList = await DBHelper.fetchData('user_places');
    _places = placesList
        .map(
          (p) => Place(
              id: p['id'],
              title: p['title'],
              image: File(p['image']),
              location: PlaceLocation(latitude: p['latitude'], longitude: p['longitude'], address: p['address'])),
        )
        .toList();
    notifyListeners();
  }
}
