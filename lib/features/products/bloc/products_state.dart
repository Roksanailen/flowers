// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

enum GetTypesStatus { loading, success, failed, init }
enum GetCategoriesStatus { loading, success, failed, init }

class ProductsState {
  final List<CategoryDataModel> categories;
  final List<Types> types;
  final GetTypesStatus getTypesStatus;
  final GetCategoriesStatus getCategoriesStatus;

  ProductsState({
    this.categories = const [],
    this.types = const [],
    this.getTypesStatus = GetTypesStatus.init,
    this.getCategoriesStatus = GetCategoriesStatus.init,
  });

  ProductsState copyWith({
    List<CategoryDataModel>? categories,
    List<Types>? types,
    GetTypesStatus? getTypesStatus,
    GetCategoriesStatus? getCategoriesStatus,
  }) {
    return ProductsState(
      categories: categories ?? this.categories,
      types: types ?? this.types,
      getTypesStatus: getTypesStatus ?? this.getTypesStatus,
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
    );
  }
}
