import 'package:data/di/data_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'feature_injection.config.dart';

final featureInjector = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupFeatureInjection(Environment env) async {
  await setupDataInjection(env);
  featureInjector.registerDependencies();
}