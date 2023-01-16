import 'package:data/repositories/firestore_repository.dart';
import 'package:injectable/injectable.dart';

import '../base/use_case.dart';

@injectable
class OrdersUseCase extends UseCaseResult<void> {
  final FirestoreRepository _firestoreRepository;

  OrdersUseCase(this._firestoreRepository);

  @override
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
  }
}