import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/repositories/firestore_repository.dart';
import 'package:injectable/injectable.dart';

import '../base/use_case.dart';

@injectable
class OrdersUseCase extends ReactiveUseCase<QuerySnapshot<Map<String, dynamic>>, String?> {
  final FirestoreRepository _firestoreRepository;

  OrdersUseCase(this._firestoreRepository);

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> buildUseCaseStream(String? params) async {
    return _firestoreRepository.getListOrderByUser();
  }

/* @override
  Future<List<Map>> execute() async {
    List<Map> listOrder = [];
    await _firestoreRepository.getListOrderByUser().then((value) {
      value.docs.forEach((doc) {
        var data = doc.data();
        data.addAll({'id': doc.id});
        listOrder.add(data);
      });
      listOrder;
    });
    return listOrder;
  }*/
}
