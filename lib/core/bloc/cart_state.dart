part of 'cart_bloc.dart';

class CartState {
  final GetOrdersStatus status;
  final List<ProductModel> products;
  CartState({this.products = const [], this.status = GetOrdersStatus.init});

  CartState copyWith({
    List<ProductModel>? products,
    final GetOrdersStatus? status,
  }) {
    return CartState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
