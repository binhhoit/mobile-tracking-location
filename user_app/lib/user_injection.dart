import 'package:feature/di/feature_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'firebase_options.dart';
import 'user_injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupInjection(Environment env) async {
  await setupFeatureInjection(env);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injector.registerDependencies(environment: env.name);
}
