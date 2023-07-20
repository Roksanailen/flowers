import 'package:flutter/material.dart';
import 'package:flutter_appflowers/Myhome.dart';
import 'package:flutter_appflowers/Production.dart';
import 'register_screen.dart';
import '../controller/login_controller.dart';
import '../password.dart';
import 'package:get/get.dart';
import 'package:flutter_appflowers/AccountScreen/changepassword.dart';

class login extends StatelessWidget {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      padding: EdgeInsets.only(right: 200),
                      child: const Text(
                        'Username',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: controller.usernameController.value,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Enter a username  ',
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 200),
                      child: const Text(
                        'Password',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controller.passwordController.value,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Enter a password',
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(

                        child: Center(
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              primary: Colors.white
                            ),
                            onPressed: () {
                              controller.login();
                            },
                            child: Text(
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
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
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
                            Get.to( ChangePasswordPage());
                          },
                          child: const Text(
                            'click here',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black87),
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
        ));
  }
}
