

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(32.29898720, -9.10134980);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,

      initialCameraPosition: CameraPosition(
        target: _center,

        zoom: 11.0,
        
      ),
      markers: <Marker>{
          Marker(
            markerId: const MarkerId('marker_1'),
            position: _center,
            infoWindow: const InfoWindow(
              title: 'Safi',
              snippet: 'A beautiful city',
            ),
          ),
        },
    );
  }
}