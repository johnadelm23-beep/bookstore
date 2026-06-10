part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderHistoryLoading extends OrderState {}

final class OrderHistorySuccess extends OrderState {
  final List<Order> order;
  OrderHistorySuccess({required this.order});
}

final class OrderHistoryError extends OrderState {}
