import 'package:dartz/dartz.dart';
import 'package:flowers/core/models/user_model.dart';
import 'package:flowers/core/unified_api/handling_exception_manager.dart';

import '../../../core/error/failures.dart';
import '../../../core/unified_api/api_variables.dart';
import '../../../core/unified_api/post_api.dart';

class ProfileRepository with HandlingExceptionManager {
  Future<Either<Failure, LoginModel>> changePassword(
      String oldPassword, String password, String confirmPassword) {
    return wrapHandling(tryCall: () async {
      return Right(await ProfileRequests()
          .changePassword(oldPassword, password, confirmPassword));
    });
  }
}

class ProfileRequests {
  Future<LoginModel> changePassword(
      oldPassword, password, confirmPassword) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().changePassword(),
        body: {
          "currentPassword": oldPassword,
          "password": password,
          'passwordConfirmation': confirmPassword
        },
        fromJson: loginModelFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}
