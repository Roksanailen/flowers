part of 'order_bloc.dart';

abstract class OrderEvent {
  const OrderEvent();
}

class GetMyOrdersEvent extends OrderEvent {}

class CreateOrderEvent extends OrderEvent {}
