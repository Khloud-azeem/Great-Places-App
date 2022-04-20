import 'package:flutter/material.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImgUrl;

  Future<void> _getCurrentLocation() async {
    final location = await Location().getLocation();
    final mapImgUrl = LocationHelper.getLocationPreviewImg(
        latitude: location.latitude as double,
        longitude: location.longitude as double);
    print(location.latitude);
    print(location.latitude);
    setState(() {
      _previewImgUrl = mapImgUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: _previewImgUrl == null
              ? Text('No location choosen yet...')
              : Image.network(
                  _previewImgUrl as String,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.location_on),
                label: Text('CURRENT LOCATION')),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text('SELECT ON MAP')),
          ],
        ),
      ],
    );
  }
}
