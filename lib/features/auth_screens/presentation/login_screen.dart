import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import 'changepassword.dart';
import 'register_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/dd.jpg',
                          fit: BoxFit.cover,
                          height: 220,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 200),
                        child: const Text(
                          'Username',
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.usernameController.value,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: 'Enter a username  ',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              )),
                          validator: (text) => text != null && text.length > 3 ? null : 'please add a valid username'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 200),
                        child: const Text(
                          'Password',
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.passwordController.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Enter a password',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            )),
                        validator: (text) => text != null && text.length > 6 ? null : 'please add a valid password',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont have an account? ',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(RegisterScreen());
                            },
                            child: const Text(
                              'register',
                              style: TextStyle(fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            ' forget the password? ',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const ChangePasswordPage());
                            },
                            child: const Text(
                              'click here',
                              style: TextStyle(fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
