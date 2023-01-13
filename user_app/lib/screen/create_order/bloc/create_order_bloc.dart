import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/usecases/location/tracking_location_driver_use_case.dart';
import 'package:data/usecases/location/update_status_request_tracking_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:user_app/screen/tracking/bloc/tracking_state.dart';

import 'create_order_state.dart';

@injectable
class CreateOrderBloc extends Cubit<CreateOrderState> {
  UpdateRequestTrackingUseCase updateFirestoreUseCase;

  CreateOrderBloc(this.updateFirestoreUseCase) : super(const CreateOrderInit());

  void updateStatusTrackingMap(LatLng destination) {
    updateFirestoreUseCase.execute(geoPoint: GeoPoint(destination.latitude, destination.longitude));
  }
}
