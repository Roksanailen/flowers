import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      TextFormField(
                        controller: controller.usernameController.value,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Enter your username',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.emailController.value,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Enter your email  ',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.phoneController.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Enter your phone',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: controller.passwordController.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Enter your password ',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'confirm password',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.white),
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
