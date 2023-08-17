import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flowers/core/bloc/cart_bloc.dart';
import 'package:flowers/dependency_injection.dart';
import 'package:flowers/features/products/requests/products_requests.dart';

import '../../../core/models/categories_response_model.dart';
import '../../../core/models/products_model.dart';
import '../../../core/models/types_response_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState()) {
    on<GetTypesEvent>(_mapGetTypesEventToState);
    on<GetCategoriesEvent>(_mapGetCategoriesEventToState);
    on<GetProductsEvent>(_mapGetProductsEventToState);
    on<GetColorsEvent>((event, emit) async {});
    on<GetOccasionsEvent>((event, emit) async {});
    on<UpdateScreenEvent>((event, emit) async {
      if (serviceLocator<CartBloc>().state.products.contains(event.product)) {
        emit(state.copyWith(
            products: List.of(state.products)
              ..removeWhere((element) => element.id == event.product.id)));
      } else {
        emit(state.copyWith(
            products: List.of(state.products)
              ..add(event.product)
              ..map((e) => e).toSet().toList()));
      }
    });
  }

  FutureOr<void> _mapGetProductsEventToState(
      GetProductsEvent event, emit) async {
    emit(state.copyWith(getProductsStatus: GetProductsStatus.loading));
    final result =
        await ProductsRepository().getProductsByCategory(event.params);
    result.fold(
        (l) =>
            emit(state.copyWith(getProductsStatus: GetProductsStatus.failed)),
        (r) {
      emit(state.copyWith(
          colors: state.colors.isNotEmpty
              ? null
              : r.data!.map((e) => e.color).toSet().toList(),
          occasion: r.data!.map((e) => e.occasion).toSet().toList(),
          getProductsStatus: GetProductsStatus.success,
          products: r.data!));
      for (var element in state.products) {
        add(UpdateScreenEvent(product: element));
      }
    });
  }

  FutureOr<void> _mapGetCategoriesEventToState(event, emit) async {
    emit(state.copyWith(getCategoriesStatus: GetCategoriesStatus.loading));
    final result = await ProductsRepository().getCategories(event.typeId);
    result.fold(
        (l) => emit(
            state.copyWith(getCategoriesStatus: GetCategoriesStatus.failed)),
        (r) => emit(state.copyWith(
            getCategoriesStatus: GetCategoriesStatus.success,
            categories: r.data!)));
  }

  FutureOr<void> _mapGetTypesEventToState(event, emit) async {
    emit(state.copyWith(getTypesStatus: GetTypesStatus.loading));
    final result = await ProductsRepository().getTypes();
    result.fold(
        (l) => emit(state.copyWith(getTypesStatus: GetTypesStatus.failed)),
        (r) {
      emit(state.copyWith(
          getTypesStatus: GetTypesStatus.success, types: r.data!));
      emit(state.copyWith(getTypesStatus: GetTypesStatus.init));
    });
  }
}
