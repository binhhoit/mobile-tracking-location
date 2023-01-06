import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class TrackingLocationService {
  static const trackingLocationChannelId = 'tracking_location_id';
  static const trackingLocationChannelName = 'tracking location';
  static const foregroundId = 888;

  static final _service = FlutterBackgroundService();
  static final BehaviorSubject<Position?> _locationStream = BehaviorSubject();
  static final BehaviorSubject<bool> _isTracking = BehaviorSubject();

  // TrackingLocationService() {
  //   initializeService();
  // }

  static StreamSubscription<Position?> listenLocationChanged(
      void Function(Position?) onListen) {
    return _locationStream.listen(onListen);
  }

  static void startService() {
    _service.startService();
    _isTracking.value = true;
    _service.on('updateCallback').listen((event) async {
      var position = Position.fromMap(jsonDecode((event as Map)['position']));
      _locationStream.value = position;

      FirebaseFirestore.instance.collection('driver_location').doc('wOSYPFjGT2ZvAgm8ciDyM6eOntJ3').set(
          {
            'location': GeoPoint(position.latitude, position.longitude)
          }
      ).then((_) {
        print("THEN AAAAAAAAAAAAAAAAAAAAAA");
      }).whenComplete(() {
        print("COMPLETE AAAAAAAAAAAAAAAAAAAAAA");
      }).catchError((error) {
        print("AAAAAAAAAAAAAAAAAAAAAA $error");
      });
    });

    _service.on('errorCallback').listen((event) async {
      _isTracking.value = false;
    });
  }

  static Future stopService() async {
    _isTracking.value = false;
    var isRunning = await _service.isRunning();
    if (isRunning) {
      _service.invoke('stopService');
    }
  }

  static StreamSubscription listenTrackingStatus(Function(bool) onEvent) {
    return _isTracking.listen(onEvent);
  }

  /// Init background service
  static Future<void> initializeService() async {
    var isRunning = await _service.isRunning();
    _isTracking.value = isRunning;

    /// OPTIONAL, using custom notification channel id
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        trackingLocationChannelId, // id
        trackingLocationChannelName, // name
        description:
        'This channel is used for tracking location.', // description
        importance: Importance.max, // importance must be at low or higher level
        enableVibration: false,
        playSound: false);

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(
          iOS: IOSInitializationSettings(
              requestAlertPermission: true,
              requestBadgePermission: true,
              requestSoundPermission: true,
              onDidReceiveLocalNotification:
                  (int id, String? title, String? body, String? payload) async {
                print("onDidReceiveLocalNotification $id == $title == $body");
              }),
        ),
      );
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,
        // auto start service
        autoStart: false,
        isForegroundMode: true,
        notificationChannelId: trackingLocationChannelId,
        initialNotificationTitle: 'Tracking Location',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: foregroundId,
      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: false,

        // this will be executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: onIosBackground,
      ),
    );
  }
}

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  // await Firebase.initializeApp();
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  /// OPTIONAL when use custom notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  late LocationSettings locationSettings;

  if (defaultTargetPlatform == TargetPlatform.android) {
    locationSettings = AndroidSettings(
      //(Optional) Set foreground notification config to keep the app alive
      //when going to the background
        accuracy: LocationAccuracy.bestForNavigation,
        intervalDuration: const Duration(milliseconds: 2000));
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    locationSettings = AppleSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      activityType: ActivityType.automotiveNavigation,
      distanceFilter: 10,
      pauseLocationUpdatesAutomatically: true,
      // Only set to true if our app will be started up in the background.
      showBackgroundLocationIndicator: false,
    );
  } else {
    locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 10,
    );
  }

  Geolocator.getPositionStream(locationSettings: locationSettings)
      .handleError((dynamic error) async {
    service.invoke('errorCallback');
    service.stopSelf();
  }).listen(
        (position) async {
      // FirebaseFirestore.instance.collection('driver_location').doc('wOSYPFjGT2ZvAgm8ciDyM6eOntJ3').update(
      //     {
      //       'location': GeoPoint(position.latitude, position.longitude)
      //     }
      // ).catchError((error) => print("Failed to update user: $error"));
      service.invoke('updateCallback', {'position': jsonEncode(position)});

      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          /// OPTIONAL for use custom notification
          /// the notification id must be equals with AndroidConfiguration when you call configure() method.
          flutterLocalNotificationsPlugin.show(
            TrackingLocationService.foregroundId,
            'Tracking Location',
            'Lat: ${position.latitude.toString()} - Long: ${position.longitude
                .toString()}',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                  'my_foreground', 'MY FOREGROUND SERVICE',
                  // ongoing: true,
                  icon: 'ic_launcher',
                  playSound: false,
                  enableVibration: false,
                  ongoing: true,
                  importance: Importance.max,
                  priority: Priority.max),
            ),
          );
        }
      }
    },
  );
}
