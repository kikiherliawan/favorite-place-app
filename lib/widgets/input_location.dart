import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class InputLocation extends StatefulWidget {
  const InputLocation({super.key});

  @override
  State<InputLocation> createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  Location? _pickedLocation;
  var _isGettingLocation = false;

  //method fetch current location
  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final let = locationData.latitude;
    final lng = locationData.longitude;

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$let,$lng&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag',
    );
    final response = await http.get(url);
    final resData = jsonDecode(response.body);
    final address = resData['result'][0]['formatted_address'];

    setState(() {
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No Location Choosen',
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
    );
    if (_isGettingLocation) {
      previewContent = CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            border: BoxBorder.all(
              width: 1,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: Text('Get Current Location'),
              icon: Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text('Select On Map'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
