import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/tracking_bloc.dart';
import '../bloc/tracking_state.dart';

class MapBody extends StatefulWidget {
  MapBody({Key? key}) : super(key: key);

  @override
  State<MapBody> createState() => _MapBody();
}

class _MapBody extends State<MapBody> {
  TrackingBloc? _bloc;
  final Set<Marker> _markers = {};
  late GoogleMapController _mapController;
  final initLocation = const LatLng(
    0,
    0,
  );
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<TrackingBloc>();
    _bloc?.trackingLocationDriver("wOSYPFjGT2ZvAgm8ciDyM6eOntJ3");
    getPolyPoints(const LatLng(10.7990167, 106.628680), const LatLng(10.743606, 106.627399));
    super.initState();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
  }

  void _loadMarkers(LatLng latLng) async {
    final maker = Marker(
      icon: BitmapDescriptor.defaultMarker,
      markerId: MarkerId('1'),
      position: latLng,
      infoWindow: InfoWindow(
        title: "driver user",
        snippet: latLng.toString(),
      ),
      onTap: () {},
    );

    if (mounted) {
      setState(() {
        _markers.add(maker);
      });
    }
  }

  Future<void> _updateCameraToBounds(LatLng latLng) async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await _mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 13.5)));
    });
  }

  void getPolyPoints(LatLng destination, LatLng position) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAQy6JqnYDxGUUGwRj0bQrs7a9tr1z08iQ", // Your Google Map Key
      PointLatLng(position.latitude, position.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print("Error ${result.errorMessage}");
    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackingBloc, TrackingState>(builder: (context, state) {
      return Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: initLocation,
              zoom: 13.5,
            ),
            markers: _markers,
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: polylineCoordinates,
                color: const Color(0xFF7B61FF),
                width: 6,
              ),
            },
          )
        ],
      );
    }, listener: (context, state) async {
      if (state is LocationUpdate) {
        _loadMarkers(state.latLng);
        await _updateCameraToBounds(state.latLng);
      } else if (state is LocationsUpdate) {
        //getPolyPoints(state.latLngs.last, state.latLngs.first);
      }
    });
  }
}
