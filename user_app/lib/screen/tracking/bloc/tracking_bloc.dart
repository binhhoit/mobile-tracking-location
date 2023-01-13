import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/usecases/location/tracking_location_driver_use_case.dart';
import 'package:data/usecases/location/update_status_request_tracking_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:user_app/screen/tracking/bloc/tracking_state.dart';

@injectable
class TrackingBloc extends Cubit<TrackingState> {
  TrackingLocationDriverUseCase firestoreUserCase;
  UpdateRequestTrackingUseCase updateFirestoreUseCase;

  TrackingBloc(this.firestoreUserCase, this.updateFirestoreUseCase) : super(const TrackingInit());

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
}
