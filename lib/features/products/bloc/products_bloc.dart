import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flowers/features/products/requests/products_requests.dart';

import '../../../core/models/categories_response_model.dart';
import '../../../core/models/types_response_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState()) {
    on<GetTypesEvent>(_mapGetTypesEventToState);
    on<GetCategoriesEvent>(_mapGetCategoriesEventToState);
  }

  FutureOr<void> _mapGetCategoriesEventToState(event, emit) async {
    emit(state.copyWith(getCategoriesStatus: GetCategoriesStatus.loading));
    final result = await ProductsRepository().getCategories(event.typeId);
    result.fold((l) => emit(state.copyWith(getCategoriesStatus: GetCategoriesStatus.failed)),
        (r) => emit(state.copyWith(getCategoriesStatus: GetCategoriesStatus.success, categories: r.data!)));
  }

  FutureOr<void> _mapGetTypesEventToState(event, emit) async {
    emit(state.copyWith(getTypesStatus: GetTypesStatus.loading));
    final result = await ProductsRepository().getTypes();
    result.fold((l) => emit(state.copyWith(getTypesStatus: GetTypesStatus.failed)), (r) {
      emit(state.copyWith(getTypesStatus: GetTypesStatus.success, types: r.data!));
      emit(state.copyWith(getTypesStatus: GetTypesStatus.init));
    });
  }
}
