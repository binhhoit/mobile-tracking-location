import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/repositories/firestore_repository.dart';
import 'package:injectable/injectable.dart';

import '../base/use_case.dart';

@injectable
class FirestoreUserCase extends ReactiveUseCase<DocumentSnapshot<Map<String, dynamic>>, String> {
  final FirestoreRepository _firestoreRepository;

  FirestoreUserCase(this._firestoreRepository);

  @override
  Future<Stream<DocumentSnapshot<Map<String, dynamic>>?>> buildUseCaseStream(String? params) async {
    if (params == null) {
      throw Exception();
    } else {
      return _firestoreRepository.getLocationDriver(idDriver: params);
    }
  }
}
