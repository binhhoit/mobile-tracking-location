import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.init() = OrdersInit;
  const factory OrdersState.loading() = OrdersLoading;
  const factory OrdersState.idle() = OrdersIdle;
  const factory OrdersState.error(String message) = OrdersError;
  const factory OrdersState.orders(List<Map> orders) = OrdersData;
}
