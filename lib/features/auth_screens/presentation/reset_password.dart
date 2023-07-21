import 'package:flowers/core/validation_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/main_text_failed.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
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
                  margin: const EdgeInsets.only(top: 200, right: 30),
                  child: const Text(
                    'Enter Email To Reset Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                child: MainTextField(
                  label: 'email',
                  fillColor: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  controller: _emailController,
                  validator: (text) {
                    if (text != null &&
                       text.isValidEmail()) {
                      return null;
                    }
                    return 'enter valid email';
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(style: BorderStyle.solid, color: Colors.grey),
                ),
                child: const Text(
                  'Send Email',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
