import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/tracking_bloc.dart';
import '../bloc/tracking_state.dart';
import 'location_bitmap_descriptor.dart';

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

  var destination = const LatLng(10.743553, 106.626414);
  var location = const LatLng(10.724058, 106.628605);

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<TrackingBloc>();
    _bloc?.trackingLocationDriver("wOSYPFjGT2ZvAgm8ciDyM6eOntJ3");
    getPolyPoints(destination, location);
    super.initState();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
  }

  void _loadMarkers(LatLng latLng) async {
    final icon = await LocationBitmapDescriptor.makeMarkerIcon(
      imageUrl:
          "https://lh3.googleusercontent.com/a/AEdFTp6STrQp-0wPjkAppaGlyvUe0z6kHr3MUXOZ3YkM=s83-c-mo",
      badge: null,
    );

    final maker = Marker(
      icon: icon,
      markerId: MarkerId('1'),
      position: latLng,
      infoWindow: InfoWindow(
        title: "driver user",
        snippet: latLng.toString(),
      ),
      onTap: () {},
    );

    final makerDestination = Marker(
      icon: BitmapDescriptor.defaultMarker,
      markerId: MarkerId('2'),
      position: destination,
      infoWindow: InfoWindow(
        title: "driver user",
        snippet: latLng.toString(),
      ),
      onTap: () {},
    );

    final makerLocation = Marker(
      icon: BitmapDescriptor.defaultMarker,
      markerId: MarkerId('3'),
      position: location,
      infoWindow: InfoWindow(
        title: "driver user",
        snippet: latLng.toString(),
      ),
      onTap: () {},
    );

    if (mounted) {
      setState(() {
        _markers.add(makerDestination);
        _markers.add(makerLocation);
        _markers.add(maker);
      });
    }
  }

  Future<void> _updateCameraToBounds(LatLng latLng) async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await _mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 15.5)));
    });
  }

  void getPolyPoints(LatLng destination, LatLng position) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAQy6JqnYDxGUUGwRj0bQrs7a9tr1z08iQ", // Your Google Map Key
      PointLatLng(position.latitude, position.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print("Error ${result.status}");
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
