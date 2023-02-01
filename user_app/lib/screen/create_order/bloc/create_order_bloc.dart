import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/usecases/location/update_status_request_tracking_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import 'create_order_state.dart';

@injectable
class CreateOrderBloc extends Cubit<CreateOrderState> {
  UpdateRequestTrackingUseCase updateFirestoreUseCase;

  CreateOrderBloc(this.updateFirestoreUseCase) : super(const CreateOrderInit());

  Future<void> updateStatusTrackingMap(LatLng destination, String addressName) async {
    await updateFirestoreUseCase.execute(
        geoPoint: GeoPoint(destination.latitude, destination.longitude), addressName: addressName);
    emit(const CreateOrderState.SuccessUploadOrder());
  }
}
