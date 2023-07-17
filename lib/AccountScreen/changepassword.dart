import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appflowers/AccountScreen/Login.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_appflowers/Restpassword.dart';


class ChangePasswordPage extends StatefulWidget {
   ChangePasswordPage({Key? key}):
       super(key:key);

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
                padding: EdgeInsets.only(top: 200,right: 40),
                child: Text('Enter your New Password',
                   style: TextStyle(fontSize: 22,color: Colors.black87,fontWeight: FontWeight.bold),),
              ),

              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(label: Text('confirm Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  controller: _passwordController,
                  validator: (text) {
                    if (text != null && text.length > 8) {
                      return null;
                    }
                    return 'enterValidPassword';
                  }
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20,right: 20,left: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(label: Text('confirmPassword'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                  ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
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
                  side: BorderSide(style: BorderStyle.solid,
                  width: 1,
                  color: Colors.grey),
                    primary: Colors.white)

               , child: Text('next',  style: TextStyle(color: Colors.black87),),
                onPressed: () {

                  if (_formKey.currentState!.validate()) { }
                  Get.to(ResetPasswordPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}