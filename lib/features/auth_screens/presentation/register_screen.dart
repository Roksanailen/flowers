import 'package:flowers/core/validation_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/toaster.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/main_text_failed.dart';
import '../../main_screen/presentation/main_screen.dart';
import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late AppLocalizations appLocalizations;
  var authBloc = AuthBloc();

  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var usernameController = TextEditingController();
    var confirmPassowrdController = TextEditingController();
    var isPassword = ValueNotifier(true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
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
                          margin: const EdgeInsets.only(top: 40, right: 40),
                          alignment: Alignment.center,
                          child: Text(
                            appLocalizations.registerANewAccount,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black87),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MainTextField(
                          controller: usernameController,
                          fillColor: Colors.white,
                          hint: appLocalizations.username,
                          borderRadius: BorderRadius.circular(30),
                          validator: (text) => text != null && text.length > 3
                              ? null
                              : appLocalizations.enterAValidUsername,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTextField(
                          hint: appLocalizations.email,
                          controller: emailController,
                          fillColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          validator: (email) =>
                              email != null && email.isValidEmail()
                                  ? null
                                  : appLocalizations.pleaseEnterAValidEmail,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTextField(
                          controller: phoneController,
                          fillColor: Colors.white,
                          hint: appLocalizations.phoneNumber,
                          borderRadius: BorderRadius.circular(30),
                          validator: (text) =>
                              text != null && text.isValidPhone()
                                  ? null
                                  : appLocalizations.pleaseEnterAValidPhone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isPassword,
                          builder: (_, bool isPasswordValue, child) {
                            return MainTextField(
                              hint: appLocalizations.password,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  isPassword.value = !isPasswordValue;
                                },
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: isPasswordValue
                                      ? Icon(
                                          Icons.visibility_off,
                                          key: Key(appLocalizations.show),
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          key: Key(appLocalizations.notshow),
                                        ),
                                ),
                              ),
                              isPassword: isPasswordValue,
                              controller: passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              validator: (text) => text != null &&
                                      text.length > 6
                                  ? null
                                  : appLocalizations.pleaseAddAValidPassword,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isPassword,
                          builder: (_, bool isPasswordValue, child) {
                            return MainTextField(
                              hint: appLocalizations.consfirmPassword,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  isPassword.value = !isPasswordValue;
                                },
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: isPasswordValue
                                      ? Icon(
                                          Icons.visibility_off,
                                          key: Key(appLocalizations.show),
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          key: Key(appLocalizations.notshow),
                                        ),
                                ),
                              ),
                              isPassword: isPasswordValue,
                              controller: confirmPassowrdController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              fillColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              validator: (text) => text != null &&
                                      text == (passwordController.text)
                                  ? null
                                  : appLocalizations.passwordsIsntMatched,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Center(
                            child: MainButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  authBloc.add(RegisterEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      username: usernameController.text));
                                }
                              },
                              title: appLocalizations.register,
                              height: 40,
                              width: 80,
                              color: Colors.white,
                              fontColor: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
