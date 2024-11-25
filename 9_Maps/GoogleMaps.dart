import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: WeingartenMap(),
      ),
    );
  }
}

class WeingartenMap extends StatefulWidget {
  @override
  _WeingartenMapState createState() => _WeingartenMapState();
}

class _WeingartenMapState extends State<WeingartenMap> {
  late GoogleMapController _mapController;

  final LatLng _weingartenCenter =
      LatLng(47.8084, 9.6384); // Central location in Weingarten
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    _markers.addAll([
      Marker(
        markerId: MarkerId('marker1'),
        position:
            LatLng(47.8077, 9.6330), // Example: Location near the Basilica
        infoWindow: InfoWindow(
            title: 'Basilica of St. Martin', snippet: 'Historic landmark'),
      ),
      Marker(
        markerId: MarkerId('marker2'),
        position:
            LatLng(47.8095, 9.6400), // Example: Another spot in Weingarten
        infoWindow: InfoWindow(
            title: 'Weingarten University', snippet: 'University area'),
      ),
      Marker(
        markerId: MarkerId('marker3'),
        position: LatLng(47.8069, 9.6392), // Example: Park in Weingarten
        infoWindow:
            InfoWindow(title: 'Local Park', snippet: 'Great place to relax'),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map of Weingarten'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _weingartenCenter,
          zoom: 15,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
