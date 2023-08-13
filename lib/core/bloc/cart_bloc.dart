import 'package:bloc/bloc.dart';
import 'package:flowers/core/models/products_model.dart';
import 'package:flowers/features/cart/presentation/bloc/order_bloc.dart';

import '../../features/cart/requests/cart_requests.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<UpdateCartEvent>((event, emit) {
      event.isDelete
          ? emit(state.copyWith(
              products: List.of(state.products)
                ..removeWhere((element) => element.id == event.product.id)))
          : {
              if (state.products
                  .map((e) => e.id)
                  .toList()
                  .contains(event.product.id))
                {}
              else
                {
                  emit(state.copyWith(
                      products: List.of(state.products)..add(event.product)))
                }
            };
    });
    on<CreateOrderEvent>((CreateOrderEvent event, emit) async {
      emit(state.copyWith(status: GetOrdersStatus.loading));
      final result = await CartRequestsRepository().createOrder(event.params);
      result.fold((l) => emit(state.copyWith(status: GetOrdersStatus.failed)),
          (r) => emit(state.copyWith(status: GetOrdersStatus.success)));
    });
  }
}
