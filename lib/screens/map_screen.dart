import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  const MapScreen({
    Key? key,
    this.initialLocation =
        const PlaceLocation(longitude: 40.702147, latitude: -74.015794),
    this.isSelecting = false,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;
  void _selectLocation(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YOUR MAP'), actions: [
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.of(context).pop(_selectedLocation);
          },
        )
      ]),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.latitude),
          ),
          onTap: widget.isSelecting ? _selectLocation : null,
          markers: _selectedLocation == null
              ? Set()
              : {
                  Marker(
                      markerId: MarkerId('m'),
                      position: _selectedLocation as LatLng)
                }),
    );
  }
}
