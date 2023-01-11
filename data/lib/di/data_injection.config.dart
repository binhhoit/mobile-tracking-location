// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_source/local/preferences/preference_manager.dart' as _i7;
import '../data_source/remote/http/response_transformer.dart' as _i8;
import '../repositories/firestore_repository.dart' as _i4;
import '../repositories/firestore_repository_impl.dart' as _i5;
import '../repositories/user_repository.dart' as _i9;
import '../repositories/user_repository_impl.dart' as _i10;
import '../usecases/auth/login_use_case.dart' as _i11;
import '../usecases/auth/register_use_case.dart' as _i12;
import '../usecases/location/firestore_use_case.dart' as _i6;
import 'data_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt registerDependencies({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    gh.factory<_i3.Dio>(() => dataModule.dio);
    gh.factory<_i4.FirestoreRepository>(() => _i5.FirestoreRepositoryImpl());
    gh.factory<_i6.FirestoreUserCase>(
        () => _i6.FirestoreUserCase(get<_i4.FirestoreRepository>()));
    gh.lazySingleton<_i7.PreferenceManager>(
        () => _i7.PreferenceManager.create());
    gh.factory<_i8.ResponseTransformer>(() => _i8.ResponseTransformer());
    gh.factory<_i9.UserRepository>(() => _i10.UserRepositoryImpl());
    gh.factory<_i11.LoginUseCase>(
        () => _i11.LoginUseCase(get<_i9.UserRepository>()));
    gh.factory<_i12.RegisterUseCase>(
        () => _i12.RegisterUseCase(get<_i9.UserRepository>()));
    return this;
  }
}

class _$DataModule extends _i13.DataModule {}
