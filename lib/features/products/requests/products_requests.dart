import 'package:dartz/dartz.dart';
import 'package:flowers/core/error/failures.dart';
import 'package:flowers/core/models/categories_response_model.dart';
import 'package:flowers/core/models/types_response_model.dart';
import 'package:flowers/core/unified_api/api_variables.dart';
import 'package:flowers/core/unified_api/get_api.dart';
import 'package:flowers/core/unified_api/handling_exception_manager.dart';

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
}

class ProductsRequests {
  Future<TypesResponseModel> getTypes() async {
    GetApi getApi = GetApi(uri: ApiVariables().getAllTypes(), fromJson: typesResponseModelFromJson);
    final result = await getApi.callRequest();
    return result;
  }

  Future<CategoriesResponseModel> getCategories(int id) async {
    GetApi getApi = GetApi(
        uri: ApiVariables().getAllCategories(params: {'filters[type][id][\$eq]': '$id'}),
        fromJson: categoriesResponseModelFromJson);
    final result = await getApi.callRequest();
    return result;
  }

  Future<dynamic> getProductsByCategory() async {
    GetApi getApi = GetApi(uri: ApiVariables().getAllProducts(), fromJson: (json) {});
    final result = getApi.callRequest();
    return result;
  }
}
