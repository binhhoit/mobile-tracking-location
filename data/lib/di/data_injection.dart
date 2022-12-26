import 'package:data/data_source/local/preferences/preference_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'data_injection.config.dart';

final dataInjector = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'registerDependencies',
  asExtension: true,
)
Future setupDataInjection(Environment env) async {
  await Hive.initFlutter();
  await PreferenceManager.init();
  dataInjector.registerDependencies();
}
