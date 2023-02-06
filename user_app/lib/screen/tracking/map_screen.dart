import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/screen/tracking/bloc/tracking_bloc.dart';
import 'package:user_app/screen/tracking/component/map_body.dart';

import '../../user_injection.dart';

class TrackingScreen extends StatelessWidget {
  TrackingScreen(
      {Key? key,
      required this.destination,
      required this.location,
      required this.idDriver,
      required this.idOderDocument})
      : super(key: key);

  LatLng destination;
  LatLng location;
  String idDriver;
  String idOderDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        /*leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),*/
      ),
      body: BlocProvider<TrackingBloc>(
        create: (context) => injector.get(),
        child: MapBody(
          destination: destination,
          location: location,
          idDriver: idDriver,
          idOderDocument: idOderDocument,
        ),
      ),
    );
  }
}
