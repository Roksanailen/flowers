import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appflowers/features/auth_screens/requests/auth_requests.dart';
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
    final result = await AuthRequests().login(usernameController.value.text, passwordController.value.text);
    result.fold((l) {}, (loginModel) {
      GlobalFunctions().setUserInfo(user: loginModel.user!, accessToken: loginModel.jwt);
      isLoading = false;
      Get.offAll(MainScreen());

    });
  }
}
