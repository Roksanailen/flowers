import 'package:flutter/cupertino.dart';
import 'package:flowers/features/auth_screens/requests/auth_requests.dart';
import 'package:get/get.dart';

import '../../../core/global_functions.dart';
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
