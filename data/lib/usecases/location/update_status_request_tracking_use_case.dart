import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/repositories/firestore_repository.dart';
import 'package:injectable/injectable.dart';

import '../base/use_case.dart';

@injectable
class UpdateRequestTrackingUseCase extends UseCaseResult<void> {
  final FirestoreRepository _firestoreRepository;

  UpdateRequestTrackingUseCase(this._firestoreRepository);

  @override
  Future<void> execute({GeoPoint geoPoint = const GeoPoint(0, 0)}) {
    return _firestoreRepository.updateStatusTrackingLocation(
        status: "Create", geo: geoPoint, idDriver: "wOSYPFjGT2ZvAgm8ciDyM6eOntJ3");
  }
}
