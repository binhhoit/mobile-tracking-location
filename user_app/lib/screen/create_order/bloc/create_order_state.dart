import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'create_order_state.freezed.dart';

@freezed
class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState.init() = CreateOrderInit;
  const factory CreateOrderState.loading() = CreateOrderLoading;
  const factory CreateOrderState.idle() = CreateOrderIdle;
  const factory CreateOrderState.error(String message) = CreateOrderError;
  const factory CreateOrderState.locations(List<LatLng> latLngs) = LocationsUpdate;
}
