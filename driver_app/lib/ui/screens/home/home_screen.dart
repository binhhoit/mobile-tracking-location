import 'dart:async';

import 'package:driver_app/driver_injection.dart';
import 'package:feature/utils/tracking_location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription _locationSubscription;
  late StreamSubscription _trackingStatusSubscription;
  Position? _locationData;
  bool _isTracking = false;

  @override
  void initState() {
    super.initState();
    _locationSubscription =
        TrackingLocationService.listenLocationChanged((location) {
      setState(() {
        _locationData = location;
      });
    });
    _trackingStatusSubscription =
        TrackingLocationService.listenTrackingStatus((isTracking) {
      setState(() {
        _isTracking = isTracking;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Latitude: ${_locationData?.latitude ?? ""}"),
            Text("Longitude: ${_locationData?.longitude ?? ""}"),
            ElevatedButton(
                onPressed: _isTracking
                        ? stopTracking
                        : startTracking,
                child: Text(_isTracking ? "Stop Tracking" : "Start Tracking"))
          ],
        ),
      ),
    );
  }

  Future startTracking() async {
    var value = await Geolocator.requestPermission();
    if (value == LocationPermission.always ||
        value == LocationPermission.whileInUse) {
      if(await Geolocator.isLocationServiceEnabled()) {
        TrackingLocationService.startService();
        setState(() {});
      } else {
        Geolocator.openAppSettings();
      }
    }
  }

  void stopTracking() {
    TrackingLocationService.stopService();
    setState(() {});
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    _trackingStatusSubscription.cancel();
    super.dispose();
  }
}
