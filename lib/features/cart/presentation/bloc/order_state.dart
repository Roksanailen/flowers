part of 'order_bloc.dart';

enum GetOrdersStatus { loading, init, failed, success }

class OrderState {
  final GetOrdersStatus status;
  final List<OrderModel> orders;
  const OrderState(
      {this.status = GetOrdersStatus.init, this.orders = const []});

  OrderState copyWith({
    GetOrdersStatus? status,
    List<OrderModel>? orders,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
    );
  }
}
