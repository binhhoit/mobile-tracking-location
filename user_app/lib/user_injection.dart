import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:feature/di/feature_injection.dart';

import 'user_injection.config.dart';

final injector = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupInjection(Environment env) async {
  await setupFeatureInjection(env);
  injector.registerDependencies();
}
