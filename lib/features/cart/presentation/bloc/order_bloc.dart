import 'package:bloc/bloc.dart';
import 'package:flowers/features/cart/requests/cart_requests.dart';

import '../../../../core/models/order_response_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderState()) {
    on<GetMyOrdersEvent>((event, emit) async {
      emit(state.copyWith(status: GetOrdersStatus.loading));
      final result = await CartRequestsRepository().getMyOrders();
      result.fold(
          (l) => emit(state.copyWith(status: GetOrdersStatus.failed)),
          (r) => emit(
              state.copyWith(status: GetOrdersStatus.success, orders: r.data)));
    });
    on<OrderCompletedEvent>((event, emit) async {
      emit(state.copyWith(completeOrderStatus: CompleteOrderStatus.loading));
      final result = await CartRequestsRepository().completeOrder(event.id);
      result.fold(
        (l) => emit(
            state.copyWith(completeOrderStatus: CompleteOrderStatus.failed)),
        (r) => emit(
          state.copyWith(
            completeOrderStatus: CompleteOrderStatus.success,
            orders: List.of(state.orders)
              ..[state.orders.indexWhere((element) => element.id == event.id)] =
                  state.orders[state.orders
                          .indexWhere((element) => element.id == event.id)]
                      .copyWith(status: 1),
          ),
        ),
      );
    });
  }
}
