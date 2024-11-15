// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_source/local/preferences/preference_manager.dart' as _i8;
import '../data_source/remote/http/response_transformer.dart' as _i9;
import '../repositories/firestore_repository.dart' as _i4;
import '../repositories/firestore_repository_impl.dart' as _i5;
import '../repositories/user_repository.dart' as _i12;
import '../repositories/user_repository_impl.dart' as _i13;
import '../usecases/auth/check_login_use_case.dart' as _i14;
import '../usecases/auth/login_use_case.dart' as _i15;
import '../usecases/auth/register_use_case.dart' as _i16;
import '../usecases/location/tracking_location_driver_use_case.dart' as _i10;
import '../usecases/location/update_status_request_tracking_use_case.dart'
    as _i11;
import '../usecases/order/order_detail_use_case.dart' as _i6;
import '../usecases/order/orders_use_case.dart' as _i7;
import 'data_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i6.GetOrderDetailsUseCase>(
        () => _i6.GetOrderDetailsUseCase(get<_i4.FirestoreRepository>()));
    gh.factory<_i7.OrdersUseCase>(
        () => _i7.OrdersUseCase(get<_i4.FirestoreRepository>()));
    gh.lazySingleton<_i8.PreferenceManager>(
        () => _i8.PreferenceManager.create());
    gh.factory<_i9.ResponseTransformer>(() => _i9.ResponseTransformer());
    gh.factory<_i10.TrackingLocationDriverUseCase>(() =>
        _i10.TrackingLocationDriverUseCase(get<_i4.FirestoreRepository>()));
    gh.factory<_i11.UpdateRequestTrackingUseCase>(() =>
        _i11.UpdateRequestTrackingUseCase(get<_i4.FirestoreRepository>()));
    gh.factory<_i12.UserRepository>(() => _i13.UserRepositoryImpl());
    gh.factory<_i14.CheckLoginUseCase>(
        () => _i14.CheckLoginUseCase(get<_i12.UserRepository>()));
    gh.factory<_i15.LoginUseCase>(
        () => _i15.LoginUseCase(get<_i12.UserRepository>()));
    gh.factory<_i16.RegisterUseCase>(
        () => _i16.RegisterUseCase(get<_i12.UserRepository>()));
    return this;
  }
}

class _$DataModule extends _i17.DataModule {}
