import 'package:book_stroe/features/order/data/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  Future<void> getOrders() async {
    emit(OrderLoading());

    final result = await OrderRepo.getOrderHistory();

    if (result != null) {
      emit(OrderSuccess(result.orders));
    } else {
      emit(OrderError("Failed to load orders"));
    }
  }
}
