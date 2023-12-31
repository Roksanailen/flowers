import 'package:dartz/dartz.dart';
import 'package:flowers/core/bloc/language_bloc.dart';
import 'package:flowers/core/error/failures.dart';
import 'package:flowers/core/models/categories_response_model.dart';
import 'package:flowers/core/models/products_model.dart';
import 'package:flowers/core/models/types_response_model.dart';
import 'package:flowers/core/unified_api/api_variables.dart';
import 'package:flowers/core/unified_api/get_api.dart';
import 'package:flowers/core/unified_api/handling_exception_manager.dart';
import 'package:flowers/dependency_injection.dart';

class ProductsRepository with HandlingExceptionManager {
  Future<Either<Failure, TypesResponseModel>> getTypes() async {
    return wrapHandling(tryCall: () async {
      return Right(await ProductsRequests().getTypes());
    });
  }

  Future<Either<Failure, CategoriesResponseModel>> getCategories(int id) async {
    return wrapHandling(tryCall: () async {
      return Right(await ProductsRequests().getCategories(id));
    });
  }

  Future<Either<Failure, ProductsResponseModel>> getProductsByCategory(
      GetProductsParams params) async {
    return wrapHandling(tryCall: () async {
      return Right(await ProductsRequests().getProductsByCategory(params));
    });
  }
}

class ProductsRequests {
  Future<TypesResponseModel> getTypes() async {
    GetApi getApi = GetApi(
        uri: ApiVariables().getAllTypes(params: {
          if (serviceLocator<LanguageBloc>().state.locale != null)
            'locale': serviceLocator<LanguageBloc>().state.locale!.languageCode
        }),
        fromJson: typesResponseModelFromJson);
    final result = await getApi.callRequest();
    return result;
  }

  Future<CategoriesResponseModel> getCategories(int id) async {
    GetApi getApi = GetApi(
        uri: ApiVariables().getAllCategories(params: {
          'filters[type][id][\$eq]': '$id',
          if (serviceLocator<LanguageBloc>().state.locale != null)
            'locale': serviceLocator<LanguageBloc>().state.locale!.languageCode
        }),
        fromJson: categoriesResponseModelFromJson);
    final result = await getApi.callRequest();
    return result;
  }

  Future<ProductsResponseModel> getProductsByCategory(
      GetProductsParams params) async {
    GetApi getApi = GetApi(
        uri: ApiVariables().getAllProducts(params: {
          if (params.cagtegoryId != null)
            'filters[category][id][\$eq]': '${params.cagtegoryId}',
          if (params.typeId != null)
            'filters[category][type][id][\$eq]': '${params.typeId}',
          if (params.isOffer!) 'filters[price_after_offer][\$ne]': 'null',
          if (params.color != null) 'filters[color][\$contains]': params.color!,
          if (params.search != null)
            'filters[name][\$contains]': params.search!,
          if (serviceLocator<LanguageBloc>().state.locale != null)
            'locale': serviceLocator<LanguageBloc>().state.locale!.languageCode
        }),
        fromJson: productsResponseModelFromJson);
    final result = await getApi.callRequest();
    return result;
  }
}

class GetProductsParams {
  final int? cagtegoryId;
  final int? typeId;
  final bool? isOffer;
  final String? search;
  final String? color;
  GetProductsParams(
      {this.cagtegoryId,
      this.typeId,
      this.color,
      this.isOffer = false,
      this.search});
}
