import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'tracking_state.freezed.dart';

@freezed
class TrackingState with _$TrackingState {
  const factory TrackingState.init() = TrackingInit;
  const factory TrackingState.loading() = TrackingLoading;
  const factory TrackingState.idle() = TrackingIdle;
  const factory TrackingState.error(String message) = TrackingError;
  const factory TrackingState.orderData(Map<String, dynamic> data) = OrderDataState;
  const factory TrackingState.locationChange(LatLng latLng) = LocationUpdate;
}
