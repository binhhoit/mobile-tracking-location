import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreRepository {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getLocationDriver({required String idDriver});
}
