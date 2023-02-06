import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:injectable/injectable.dart';

import '../helpers/handle_network_mixin.dart';
import 'firestore_repository.dart';

@Injectable(as: FirestoreRepository)
class FirestoreRepositoryImpl extends FirestoreRepository with HandleNetworkMixin {
  FirebaseFirestore? firestore;
  FirebaseAuth? firebaseAuth;

  FirestoreRepositoryImpl() {
    firestore = FirebaseFirestore.instance;
    firebaseAuth = firebase.FirebaseAuth.instance;
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

  @override
  Future<void> updateStatusTrackingLocation(
      {required String status,
      required GeoPoint geo,
      required String idOrder,
      required String addressName,
      required GeoPoint geoStart,
      required String addressNameStart}) {
    var idUser = firebaseAuth?.currentUser?.uid ?? "";
    var documentStream = firestore?.collection(orderDocument).doc(idOrder).set({
      'status': status,
      'destination': geo,
      'create_by': idUser,
      'order_owner_id': idUser,
      'receiver_location': geo,
      'created': DateTime.now(),
      'addressName': addressName,
      'start_location': geoStart,
      'start_location_name': addressNameStart,
      'flag': true,
    });
    if (documentStream == null) {
      throw Exception("Not data");
    } else {
      return documentStream;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getListOrderByUser() {
    var idUser = firebaseAuth?.currentUser?.uid ?? "";
    Stream<QuerySnapshot<Map<String, dynamic>>>? documentStream =
        firestore?.collection(orderDocument).where("create_by", isEqualTo: idUser).snapshots();
    if (documentStream == null) {
      throw Exception("Not data");
    } else {
      return documentStream;
    }
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getOrderData({required String idOrder}) {
    Stream<DocumentSnapshot<Map<String, dynamic>>>? documentStream =
        firestore?.collection(orderDocument).doc(idOrder).snapshots();
    if (documentStream == null) {
      throw Exception("Not data");
    } else {
      return documentStream;
    }
  }
}

const String driverLocation = 'driver_location';
const String orderDocument = 'orders';
