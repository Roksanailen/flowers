part of 'order_bloc.dart';

enum GetOrdersStatus { loading, init, failed, success }
enum CompleteOrderStatus { loading, init, failed, success }

class OrderState {
  final GetOrdersStatus status;
  final CompleteOrderStatus completeOrderStatus;
  final List<OrderModel> orders;
  const OrderState(
      {this.status = GetOrdersStatus.init,
      this.completeOrderStatus = CompleteOrderStatus.init,
      this.orders = const []});

  OrderState copyWith({
    GetOrdersStatus? status,
    CompleteOrderStatus? completeOrderStatus,
    List<OrderModel>? orders,
  }) {
    return OrderState(
      completeOrderStatus: completeOrderStatus ?? this.completeOrderStatus,
      status: status ?? this.status,
      orders: orders ?? this.orders,
    );
  }
}
