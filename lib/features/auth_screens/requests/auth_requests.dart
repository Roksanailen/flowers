import 'package:dartz/dartz.dart';
import 'package:flowers/core/unified_api/handling_exception_manager.dart';

import '../../../core/error/failures.dart';
import '../../../core/models/user_model.dart';
import '../../../core/unified_api/api_variables.dart';
import '../../../core/unified_api/post_api.dart';

class AuthRequests with HandlingExceptionManager {
  Future<Either<Failure, LoginModel>> login(String username, String password) {
    return wrapHandling(tryCall: () async {
      return Right(await LoginRequests().login(username, password));
    });
  }

  Future<Either<Failure, LoginModel>> register(
      {required String username, required String password, required String email, required String phone}) {
    return wrapHandling(tryCall: () async {
      return Right(
          await RegisterRequests().register(password: password, username: username, email: email, phone: phone));
    });
  }
}

class LoginRequests {
  Future<LoginModel> login(username, password) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().login(),
        body: {"identifier": username, "password": password},
        fromJson: loginModelFromJson);
    final LoginModel result = await postApi.callRequest();
    return result;
  }
}

class RegisterRequests {
  Future<LoginModel> register(
      {required String username, required String email, required String password, required String phone}) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().register(),
        body: {"username": username, "email": email, "password": password, "phone": phone},
        fromJson: loginModelFromJson);
    final LoginModel result = await postApi.callRequest();
    return result;
  }
}
