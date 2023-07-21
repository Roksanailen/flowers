import 'package:flutter/cupertino.dart';
import 'package:flowers/features/auth_screens/requests/auth_requests.dart';
import 'package:flowers/features/main_screen/presentation/main_screen.dart';
import 'package:get/get.dart';

import '../../../core/global_functions.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  bool isLoading = false;
  void register() async {
    isLoading = true;
    update();
    final result = await AuthRequests().register(
      username: usernameController.value.text,
      email: emailController.value.text,
      password: passwordController.value.text,
      phone: phoneController.value.text,
    );
    result.fold((l) {
      isLoading = false;

      update();
    }, (registerModel) {
      GlobalFunctions().setUserInfo(user: registerModel.user!, accessToken: registerModel.jwt);
      isLoading = false;
      update();
      Get.offAll(MainScreen());
    });
  }
}
