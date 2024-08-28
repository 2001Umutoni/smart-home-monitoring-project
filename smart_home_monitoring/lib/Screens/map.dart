// maps.dart
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationTrackingScreen extends StatefulWidget {
  @override
  _LocationTrackingScreenState createState() => _LocationTrackingScreenState();
}

class _LocationTrackingScreenState extends State<LocationTrackingScreen> {
  LocationData? _currentLocation;
  final Location _locationService = Location();

  @override
  void initState() {
    super.initState();
    _locationService.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        _currentLocation = locationData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Tracking')),
      body: Center(
        child: Text(
          'Current Location: \nLatitude: ${_currentLocation?.latitude}, Longitude: ${_currentLocation?.longitude}',
        ),
      ),
    );
  }
}
