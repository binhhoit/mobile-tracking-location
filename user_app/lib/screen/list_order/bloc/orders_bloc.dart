import 'package:data/usecases/order/orders_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_app/screen/list_order/bloc/orders_state.dart';

@injectable
class OrdersBloc extends Cubit<OrdersState> {
  OrdersUseCase ordersUseCase;

  OrdersBloc(this.ordersUseCase) : super(const OrdersInit());

  Future<void> getListOrder() async {
    emit(const OrdersState.loading());
    var list = await ordersUseCase.execute();
    emit(OrdersState.orders(list));
  }
}
