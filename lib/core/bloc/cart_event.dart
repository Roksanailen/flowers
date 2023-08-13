part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class UpdateCartEvent extends CartEvent {
  final ProductModel product;
  final bool isDelete;
  UpdateCartEvent({
    required this.product,
    this.isDelete = false,
  });
}

class CreateOrderEvent extends CartEvent {
  final Map<String, dynamic> params;
  CreateOrderEvent({
    required this.params,
  });
}
