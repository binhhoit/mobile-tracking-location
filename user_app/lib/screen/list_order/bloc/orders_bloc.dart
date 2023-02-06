import 'package:data/usecases/order/orders_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_app/screen/list_order/bloc/orders_state.dart';

@injectable
class OrdersBloc extends Cubit<OrdersState> {
  OrdersUseCase ordersUseCase;

  OrdersBloc(this.ordersUseCase) : super(const OrdersInit());

  void getListOrder() async {
    emit(const OrdersState.loading());
    ordersUseCase.executeF(
        onNext: (event) {
          if (event != null) {
            List<Map> listOrder = [];
            for (var doc in event.docs) {
              var data = doc.data();
              data.addAll({'id': doc.id});
              listOrder.add(data);
            }
            emit(OrdersState.orders(listOrder));
          }
        },
        onError: (e) {},
        onComplete: () {});
  }
}
