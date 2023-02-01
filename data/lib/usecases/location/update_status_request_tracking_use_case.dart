import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/repositories/firestore_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../base/use_case.dart';

@injectable
class UpdateRequestTrackingUseCase extends UseCaseResult<void> {
  final FirestoreRepository _firestoreRepository;

  UpdateRequestTrackingUseCase(this._firestoreRepository);

  @override
  Future<void> execute({
    GeoPoint geoPoint = const GeoPoint(0, 0),
    String addressName = "",
  }) {
    var uuidRandomId = Uuid();
    return _firestoreRepository.updateStatusTrackingLocation(
        status: "Create", geo: geoPoint, idOrder: uuidRandomId.v4(), addressName: addressName);
  }
}
