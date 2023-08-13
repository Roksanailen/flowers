part of 'order_bloc.dart';

abstract class OrderEvent {
  const OrderEvent();
}

class GetMyOrdersEvent extends OrderEvent {}

class OrderCompletedEvent extends OrderEvent {
  final int id;
  OrderCompletedEvent({
    required this.id,
  });
}
