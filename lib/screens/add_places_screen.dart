import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    final placesData = Provider.of<PlacesProvider>(context, listen: false);
    placesData.addPlace(_titleController.text, _pickedImage as File);
    Navigator.of(context).pop();
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WHERE'S NEXT!"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                ImageInput(selectImage: _selectImage),
                SizedBox(
                  height: 10,
                ),
                LocationInput(),
              ],
            ),
          )),
          TextButton(
            onPressed: _savePlace,
            child: Text('ADD PLACE'),
          ),
        ],
      ),
    );
  }
}
