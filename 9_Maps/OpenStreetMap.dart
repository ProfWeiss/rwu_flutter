import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MapWidget(),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(47.80887005657478, 9.644583696582753),
        initialZoom: 14,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        const CircleLayer(
          circles: [
            CircleMarker(
              point: LatLng(47.813113914533126, 9.65390919445553),
              radius: 250,
              useRadiusInMeter: true,
              color: Color(0xAA777777),
            )
          ],
        ),
        const MarkerLayer(
          markers: [
            Marker(
                point: LatLng(47.81298947955553, 9.651690117073615),
                width: 80,
                height: 80,
                child: Icon(Icons.location_on, size: 50.0, color: Colors.red))
          ],
        ),
      ],
    );
  }
}
