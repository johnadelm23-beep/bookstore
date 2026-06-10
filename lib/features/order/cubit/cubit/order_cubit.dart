import 'package:bloc/bloc.dart';
import 'package:book_stroe/features/order/data/models/order_model.dart';
import 'package:book_stroe/features/order/data/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  getOrderHistory() async {
    emit(OrderHistoryLoading());
    final response = await OrderRepo.getOrderHistory();
    if (response != null) {
      emit(OrderHistorySuccess(order: response.data.orders));
    } else {
      emit(OrderHistoryError());
    }
  }
}
