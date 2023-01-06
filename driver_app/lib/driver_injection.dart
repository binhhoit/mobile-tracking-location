import 'package:feature/di/feature_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:feature/utils/tracking_location_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'driver_injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupInjection(Environment env) async {
  await setupFeatureInjection(env);
  await TrackingLocationService.initializeService();
  await Firebase.initializeApp();
  injector.registerDependencies(environment: env.name);
}
