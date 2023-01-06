import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<TrackingBloc>();
    _bloc?.trackingLocationDriver("wOSYPFjGT2ZvAgm8ciDyM6eOntJ3");
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
          )
        ],
      );
    }, listener: (context, state) async {
      if (state is LocationUpdate) {
        _loadMarkers(state.latLng);
        await _updateCameraToBounds(state.latLng);
      }
    });
  }
}
