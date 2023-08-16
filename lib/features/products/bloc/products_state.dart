// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

enum GetTypesStatus { loading, success, failed, init }
enum GetCategoriesStatus { loading, success, failed, init }
enum GetProductsStatus { loading, success, failed, init }

class ProductsState {
  final List<CategoryDataModel> categories;
  final List<ProductModel> products;
  final List<Types> types;
  final GetTypesStatus getTypesStatus;
  final GetCategoriesStatus getCategoriesStatus;
  final GetProductsStatus getProductsStatus;
  final List<String?> occasion;
  final List<String?> colors;

  ProductsState(
      {this.colors = const [],
      this.occasion = const [],
      this.categories = const [],
      this.types = const [],
      this.products = const [],
      this.getTypesStatus = GetTypesStatus.init,
      this.getCategoriesStatus = GetCategoriesStatus.init,
      this.getProductsStatus = GetProductsStatus.init});

  ProductsState copyWith({
    List<CategoryDataModel>? categories,
    List<ProductModel>? products,
    List<Types>? types,
    GetTypesStatus? getTypesStatus,
    GetCategoriesStatus? getCategoriesStatus,
    GetProductsStatus? getProductsStatus,
    List<String?>? occasion,
    List<String?>? colors,
  }) {
    return ProductsState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      types: types ?? this.types,
      getTypesStatus: getTypesStatus ?? this.getTypesStatus,
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      occasion: occasion ?? this.occasion,
      colors: colors ?? this.colors,
    );
  }
}
