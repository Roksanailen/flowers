import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appflowers/features/auth_screens/requests/auth_requests.dart';
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
    final result = await AuthRequests().register(
      username: usernameController.value.text,
      email: emailController.value.text,
      password: passwordController.value.text,
      phone: phoneController.value.text,
    );
    result.fold((l) {}, (registerModel) {
      GlobalFunctions().setUserInfo(user: registerModel.user!, accessToken: registerModel.jwt);
      isLoading = false;
      Get.offAll(const Production());
    });


  }
}
