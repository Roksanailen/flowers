import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/global_functions.dart';
import '../../../core/models/user_model.dart';
import '../../../core/unified_api/api_variables.dart';
import '../../../core/unified_api/post_api.dart';
import '../../../production.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  bool isLoading = false;
  void register() async {
    isLoading = true;
    final LoginModel? registerModel = await RegisterRequests().register(
      username: usernameController.value.text,
      email: emailController.value.text,
      password: passwordController.value.text,
      phone: phoneController.value.text,
    );
    if (registerModel != null) {
      GlobalFunctions().setUserInfo(user: registerModel.user!, accessToken: registerModel.jwt);
      isLoading = false;
      Get.offAll(Production());
    }
    log(registerModel.toString(), name: 'omar');
  }
}

class RegisterRequests {
  Future<LoginModel?> register(
      {required String username, required String email, required String password, required String phone}) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().register(),
        body: {"username": username, "email": email, "password": password, "phone": phone},
        fromJson: loginModelFromJson);
    final LoginModel? result = await postApi.callRequest();
    return result;
  }
}
