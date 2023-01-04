import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../helpers/handle_network_mixin.dart';
import 'firestore_repository.dart';

@Injectable(as: FirestoreRepository)
class FirestoreRepositoryImpl extends FirestoreRepository with HandleNetworkMixin {
  FirebaseFirestore? firestore;

  FirestoreRepositoryImpl() {
    firestore = FirebaseFirestore.instance;
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getLocationDriver({required String idDriver}) {
    Stream<DocumentSnapshot<Map<String, dynamic>>>? documentStream =
        firestore?.collection(driverLocation).doc(idDriver).snapshots();
    if (documentStream == null) {
      throw Exception("Not data");
    } else {
      return documentStream;
    }
  }
}

const String driverLocation = 'driver_location';
