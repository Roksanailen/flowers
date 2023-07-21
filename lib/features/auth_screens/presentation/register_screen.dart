import 'package:flowers/core/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/main_text_failed.dart';
import '../controllers/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, right: 40),
                        alignment: Alignment.center,
                        child: const Text(
                          'Register a new account',
                          style: TextStyle(fontSize: 25, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MainTextField(
                        controller: controller.usernameController.value,
                        fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                        validator: (text) => text != null && text.length > 6 ? null : 'enter a valid username',  
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainTextField(
                        controller: controller.emailController.value,
                        fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                        validator: (email) =>
                            email != null && email.isValidEmail() ? null : 'please enter a valid email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainTextField(
                        controller: controller.phoneController.value,
                        fillColor: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                     
                        validator: (text) => text != null && text.isValidPhone() ? null : 'please enter a valid phone',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainTextField(
                        controller: controller.passwordController.value,
                        fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                        validator: (text) =>
                            text != null && text.isValidPassword() ? null : 'please enter a valid password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainTextField(
                        fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                        controller: TextEditingController(),
                        validator: (text) => text != null && text == controller.passwordController.value.text
                            ? null
                            : 'password isn\'t compatible',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {
                              controller.register();
                            },
                            child: const Text(
                              'register',
                              style: TextStyle(fontSize: 20, color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
