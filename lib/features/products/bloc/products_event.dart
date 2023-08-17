// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

abstract class ProductsEvent {
  const ProductsEvent();
}

class GetTypesEvent extends ProductsEvent {}

class GetCategoriesEvent extends ProductsEvent {
  final int typeId;
  GetCategoriesEvent({
    required this.typeId,
  });
}

class GetProductsEvent extends ProductsEvent {
  final GetProductsParams params;
  GetProductsEvent({
    required this.params,
  });
}

class GetOccasionsEvent extends ProductsEvent {}

class UpdateScreenEvent extends ProductsEvent {
  final ProductModel product;
  final bool add;
  UpdateScreenEvent({required this.product, this.add = false});
}

class GetColorsEvent extends ProductsEvent {}
