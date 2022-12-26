import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'driver_injection.config.dart';

final injector = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupInjection(Environment env) async {
  injector.registerDependencies(environment: env.name);
}
