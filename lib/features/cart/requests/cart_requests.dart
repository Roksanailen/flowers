import 'package:dartz/dartz.dart';
import 'package:flowers/core/models/no_response.dart';
import 'package:flowers/core/models/order_response_model.dart';
import 'package:flowers/core/unified_api/api_variables.dart';
import 'package:flowers/core/unified_api/get_api.dart';
import 'package:flowers/core/unified_api/handling_exception_manager.dart';

import '../../../core/error/failures.dart';
import '../../../core/unified_api/post_api.dart';

class CartRequests {
  Future<OrderResponseModel> getMyOrders() async {
    final getApi = GetApi(
        uri: ApiVariables().getMyOrders(),
        fromJson: orderResponseModelFromJson);
    final result = await getApi.callRequest();

    return result;
  }

  Future<NoResponse> createOrder(params) async {
    final postApi = PostApi(
        uri: ApiVariables().getMyOrders(),
        body: params,
        fromJson: noResponseFromJson);
    final result = await postApi.callRequest();

    return result;
  }

  Future<NoResponse> completeOrder(id) async {
    final postApi = PostApi(
        uri: ApiVariables().completeOrder(id: id),
        body: {},
        fromJson: noResponseFromJson);
    final result = await postApi.callRequest();

    return result;
  }
}

class CartRequestsRepository with HandlingExceptionManager {
  Future<Either<Failure, OrderResponseModel>> getMyOrders() async {
    return wrapHandling(tryCall: () async {
      final result = await CartRequests().getMyOrders();
      return Right(result);
    });
  }

  Future<Either<Failure, NoResponse>> createOrder(params) async {
    return wrapHandling(tryCall: () async {
      final result = await CartRequests().createOrder(params);
      return Right(result);
    });
  }

  Future<Either<Failure, NoResponse>> completeOrder(int id) async {
    return wrapHandling(tryCall: () async {
      final result = await CartRequests().completeOrder(id);
      return Right(result);
    });
  }
}
