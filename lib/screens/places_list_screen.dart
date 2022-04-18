import "package:flutter/material.dart";
import 'package:great_places/providers/places_provider.dart';
import 'package:great_places/screens/add_places_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YOUR PLACES'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<PlacesProvider>(
        child: Center(child: Text("NO PLACES YET! ADD SOME!")), //static child
        builder: (context, placesData, child) => placesData.places.isEmpty
            ? child as Widget
            : ListView.builder(
                itemCount: placesData.places.length,
                itemBuilder: (context, idx) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(placesData.places[idx].image),
                  ),
                  title: Text(placesData.places[idx].title),
                  onTap: (){},
                ),
              ),
      ),
      // Center(child: CircularProgressIndicator()),
    );
  }
}
