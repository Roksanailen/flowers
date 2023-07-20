import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/global_functions.dart';
import '../../../core/models/user_model.dart';
import '../../../core/unified_api/api_variables.dart';
import '../../../core/unified_api/post_api.dart';
import '../../main_screen/presentation/main_screen.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController().obs;

  final passwordController = TextEditingController().obs;
  bool isLoading = false;
  void login() async {
    isLoading = true;
    final LoginModel? loginModel =
        await LoginRequests().login(usernameController.value.text, passwordController.value.text);
    if (loginModel != null) {
      GlobalFunctions().setUserInfo(user: loginModel.user!, accessToken: loginModel.jwt);
      isLoading = false;
      Get.offAll(MainScreen());
    }
    log(loginModel.toString(), name: 'omar');
  }
}

class LoginRequests {
  Future<LoginModel?> login(username, password) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().login(),
        body: {"identifier": username, "password": password},
        fromJson: loginModelFromJson);
    final LoginModel? result = await postApi.callRequest();
    return result;
  }
}
