import 'package:dartz/dartz.dart';
import 'package:flowers/core/models/order_response_model.dart';
import 'package:flowers/core/unified_api/api_variables.dart';
import 'package:flowers/core/unified_api/get_api.dart';
import 'package:flowers/core/unified_api/handling_exception_manager.dart';

import '../../../core/error/failures.dart';

class CartRequests {
  Future<OrderResponseModel> getMyOrders() async {
    final getApi = GetApi(
        uri: ApiVariables().getMyOrders(),
        fromJson: orderResponseModelFromJson);
    final result = await getApi.callRequest();

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
}
