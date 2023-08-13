import 'package:flowers/core/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/main_text_failed.dart';
import '../../main_screen/presentation/main_screen.dart';
import '../bloc/auth_bloc.dart';
import 'changepassword.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();

  var usernameController = TextEditingController();

  var authBloc = AuthBloc();

  var isPassword = ValueNotifier(true);
  late AppLocalizations appLocalizations;
  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider(
        create: (context) => authBloc,
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            if (state.status == AuthStatus.loading) {
              Toaster.showLoading();
            } else if (state.status == AuthStatus.success) {
              Toaster.closeLoading();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainScreen()));
            } else if (state.status == AuthStatus.failed) {
              Toaster.closeLoading();
              Toaster.showToast('حدث خطأ ما');
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      MainTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: usernameController,
                          fillColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          borderRadius: BorderRadius.circular(30),
                          hint: 'Enter a username  ',
                          validator: (text) => text != null && text.length > 3
                              ? null
                              : 'please add a valid username'),
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
                      ValueListenableBuilder(
                        valueListenable: isPassword,
                        builder: (_, bool isPasswordValue, child) {
                          return MainTextField(
                            hint: 'Password',
                            textInputAction: TextInputAction.go,
                            onSubmitted: (value) {
                              authBloc.add(LoginEvent(
                                  userName: usernameController.text,
                                  password: passwordController.text));
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isPassword.value = !isPasswordValue;
                              },
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: isPasswordValue
                                    ? const Icon(
                                        Icons.visibility_off,
                                        key: Key("show"),
                                      )
                                    : const Icon(
                                        Icons.remove_red_eye,
                                        key: Key("notShow"),
                                      ),
                              ),
                            ),
                            isPassword: isPasswordValue,
                            controller: passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            fillColor: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            validator: (text) => text != null && text.length > 6
                                ? null
                                : 'please add a valid password',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: MainButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              authBloc.add(LoginEvent(
                                  userName: usernameController.text,
                                  password: passwordController.text));
                            }
                          },
                          title: 'Login',
                          width: 80,
                          height: 40,
                          fontColor: Colors.black,
                          color: Colors.white,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                            },
                            child: const Text(
                              'register',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
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
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ChangePasswordPage();
                              }));
                            },
                            child: const Text(
                              'click here',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()));
                          },
                          child: const Text('Continue as guest'))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
