import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/main_text_failed.dart';
import 'reset_password.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 200, right: 40),
                child: const Text(
                  'Enter your New Password',
                  style: TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                child: MainTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    label: 'confirm Password',
                    borderRadius: BorderRadius.circular(30),
                    fillColor: Colors.white,
                    controller: _passwordController,
                    validator: (text) {
                      if (text != null && text.length > 8) {
                        return null;
                      }
                      return 'enterValidPassword';
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: MainTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  label: 'confirmPassword',
                  borderRadius: BorderRadius.circular(30),
                  fillColor: Colors.white,
                  controller: _confirmPasswordController,
                  validator: (text) {
                    if (text != null && text == _passwordController.text) {
                      return null;
                    } else {
                      return 'passwordNotMatch';
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(style: BorderStyle.solid, width: 1, color: Colors.grey),
                ),
                child: const Text(
                  'next',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                  Get.to(const ResetPasswordPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
