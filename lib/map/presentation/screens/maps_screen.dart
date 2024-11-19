import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sales_dashboard/config/router/app_router.dart';
import 'package:sales_dashboard/dashboard/infrastructure/datasources/local_storage_cliente_datasource_imp.dart';
import 'package:sales_dashboard/dashboard/infrastructure/repositories/local_storage_cliente_repository_impl.dart';


// final List<LatLng> coordenadasLosMochis = [
//   const LatLng(25.7791, -108.9887),  // Centro de Los Mochis
//   const LatLng(25.7745, -108.9846),  // Zona Norte
//   const LatLng(25.7743, -108.9692),  // Colegio de Bachilleres
//   const LatLng(25.7557, -108.9861),  // Parque Sinaloa
//   const LatLng(25.7673, -109.0012),  // Aprox. Zona Industrial
//   const LatLng(25.7572, -109.0106),  // Zona sur
//   const LatLng(25.8205, -108.9502),  // Ejido 5 de Febrero
//   const LatLng(25.8000, -108.9893),  // Alrededores de la playa
// ];

class MapPage extends StatefulWidget {
  
  final clienteRepository = ClienteRepositoryImpl(IsarClienteDatasource());

  MapPage({
    super.key,
  });
  static const String name = 'mapa';
  

  final Location locationController = Location();

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Future<List<LatLng>> get coordenadasLosMochis async => await widget.clienteRepository.obtenerPagosPorFecha(DateTime.now());
  
  //late LocationData _locationData;
  Location locationController = Location();
  LatLng? currentP = const LatLng(25.7791, -108.9887);
  final Completer<GoogleMapController> _mapController = 
  Completer<GoogleMapController>();
  Map<PolylineId, Polyline> polylines = {};

  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    loadPolyline();
  }
  
  Future<void> loadPolyline() async {
    markers = await _createMarkers();
    getCurrentLocation();
    final coordinates = await getPolylinePoints();
    generatePolylineFromPoints(coordinates);
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.changeSettings(
      accuracy: LocationAccuracy.high, 
      interval: 1000, 
      distanceFilter: 10,
    );

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    try {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: pos,
          zoom: 14,
        ),
      ));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<Set<Marker>> _createMarkers() async{
    final coordinates = await coordenadasLosMochis;
    return coordinates.map((coordenada) {
      return Marker(
        markerId: MarkerId(coordenada.toString()),
        position: coordenada,
        infoWindow: InfoWindow(
          title: 'Coordenadas',
          snippet: '${coordenada.latitude}, ${coordenada.longitude}',
        ),
      );
    }).toSet();
  }

  Future<List<LatLng>> getPolylinePoints() async { 
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    final coordinates = await coordenadasLosMochis;
    if (coordinates.isEmpty) {
      return [];
    }
    List<PolylineWayPoint> wayPoints = coordinates
        .sublist(0, coordinates.length)
        .map((coord) => PolylineWayPoint(
              location: '${coord.latitude},${coord.longitude}',
            ))
        .toList();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyCA5njaec2o4RNfkCkpRNigBwo-FT43ovs",
      request: PolylineRequest(
        origin: PointLatLng(currentP!.latitude, currentP!.longitude),
        destination: PointLatLng(coordinates[coordinates.length - 1].latitude, coordinates[coordinates.length - 1].longitude),
        mode: TravelMode.driving,
        wayPoints: wayPoints,
      ),
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates.addAll(result.points.map((point) => LatLng(point.latitude, point.longitude)));
    }

    return polylineCoordinates;
  }

  void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {
      polylines[id] = polyline;
    });
  }


  @override
  Widget build(BuildContext context) {
    print(coordenadasLosMochis);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: currentP == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentP!,
                zoom: 14,
              ),
              onMapCreated: (GoogleMapController controller) {
                if (!_mapController.isCompleted) {
                  _mapController.complete(controller);
                }
              },
              polylines: Set<Polyline>.of(polylines.values),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: markers,
            ),
    );
  }

}
