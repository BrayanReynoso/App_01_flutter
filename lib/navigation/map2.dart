import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double zoom;

  const MapView({
    super.key,
    required this.latitude,
    required this.longitude,
    this.zoom = 14.0,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late CameraPosition _initialPosition;

  @override
  void initState() {
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: widget.zoom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId('targetLocation'),
          position: LatLng(widget.latitude, widget.longitude),
          infoWindow: const InfoWindow(title: 'Ubicación del Restaurante'),
        ),
      },
    );
  }
}
