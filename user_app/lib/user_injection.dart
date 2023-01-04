import 'package:feature/di/feature_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'user_injection.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupInjection(Environment env) async {
  await setupFeatureInjection(env);
  injector.registerDependencies(environment: env.name);
}
