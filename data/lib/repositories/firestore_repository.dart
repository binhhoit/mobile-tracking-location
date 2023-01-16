import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreRepository {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getLocationDriver({required String idDriver});

  Future<void> updateStatusTrackingLocation(
      {required String status, required GeoPoint geo, required String idOrder});

  Future<QuerySnapshot<Map<String, dynamic>>> getListOrderByUser();

  Stream<DocumentSnapshot<Map<String, dynamic>>> getOrderData({required String idOrder});
}
