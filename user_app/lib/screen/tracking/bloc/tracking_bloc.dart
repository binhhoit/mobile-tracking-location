import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/usecases/location/tracking_location_driver_use_case.dart';
import 'package:data/usecases/location/update_status_request_tracking_use_case.dart';
import 'package:data/usecases/order/order_detail_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:user_app/screen/tracking/bloc/tracking_state.dart';

@injectable
class TrackingBloc extends Cubit<TrackingState> {
  TrackingLocationDriverUseCase firestoreUserCase;
  UpdateRequestTrackingUseCase updateFirestoreUseCase;
  GetOrderDetailsUseCase getOrderDetailsUseCase;

  TrackingBloc(this.firestoreUserCase, this.updateFirestoreUseCase, this.getOrderDetailsUseCase)
      : super(const TrackingState.init());

  void trackingLocationDriver(String idDriver) async {
    firestoreUserCase.executeF(
        onNext: (event) {
          if (event != null) {
            var data = event.data() as Map<String, dynamic>;
            var location = data['location'] as GeoPoint;
            emit(TrackingState.locationChange(LatLng(location.latitude, location.longitude)));
          }
        },
        onError: (e) {
          emit(TrackingState.error(e.toString()));
        },
        onComplete: () {},
        params: idDriver);
  }

  void orderDetailStream(String idOder, String idDriver) async {
    getOrderDetailsUseCase.executeF(
        onNext: (event) async {
          if (event != null) {
            var data = event.data() as Map<String, dynamic>;
            if (data['status'] == 'In-progress') {
              trackingLocationDriver(idDriver);
            } else if (data['status'] == 'Done' || data['status'] == 'Canceled') {
              firestoreUserCase.dispose();
            } else {
              emit(TrackingState.error('Order Status ${data['status']}'));
            }
            await Future.delayed(const Duration(milliseconds: 1000));
            emit(TrackingState.orderData(data));
          }
        },
        onError: (e) {
          emit(TrackingState.error(e.toString()));
        },
        onComplete: () {},
        params: idOder);
  }

  @override
  Future close() async {
    getOrderDetailsUseCase.dispose();
    firestoreUserCase.dispose();
    super.close();
  }
}
