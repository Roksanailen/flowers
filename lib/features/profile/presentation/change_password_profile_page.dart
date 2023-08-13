import 'package:flowers/core/toaster.dart';
import 'package:flowers/features/profile/presentation/bloc/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/widgets/main_text_failed.dart';

class ChangePasswordProfilePage extends StatefulWidget {
  const ChangePasswordProfilePage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordProfilePage> createState() =>
      _ChangePasswordProfilePageState();
}

class _ChangePasswordProfilePageState extends State<ChangePasswordProfilePage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _oldPasswordController;
  late AppLocalizations appLocalizations;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _oldPasswordController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    changePasswordBloc = ChangePasswordBloc();
  }

  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  late final ChangePasswordBloc changePasswordBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          bloc: changePasswordBloc,
          listener: (context, state) {
            if (state.status == ChangePasswordStats.loading) {
              Toaster.showLoading();
            } else if (state.status == ChangePasswordStats.failed) {
              Toaster.closeLoading();
              Toaster.showToast('Failed Please Check Details');
            } else if (state.status == ChangePasswordStats.success) {
              Toaster.closeLoading();
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, right: 40),
                    child: const Text(
                      'Enter your Old Password',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: MainTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        label: 'Old Password',
                        borderRadius: BorderRadius.circular(30),
                        fillColor: Colors.white,
                        controller: _oldPasswordController,
                        validator: (text) {
                          if (text != null && text.length >= 8) {
                            return null;
                          }
                          return 'enterValidPassword';
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, right: 40),
                    child: const Text(
                      'Enter your New Password',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: MainTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        label: 'New Password',
                        borderRadius: BorderRadius.circular(30),
                        fillColor: Colors.white,
                        controller: _passwordController,
                        validator: (text) {
                          if (text != null && text.length >= 8) {
                            return null;
                          }
                          return 'enterValidPassword';
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, right: 40),
                    child: const Text(
                      'Confirm New Password',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    child: MainTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      label: 'Confirm Password',
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
                      side: const BorderSide(
                          style: BorderStyle.solid,
                          width: 1,
                          color: Colors.grey),
                    ),
                    child: const Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black87),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        changePasswordBloc.add(ChangeUserPasswordEvent(
                            password: _passwordController.text,
                            oldPassword: _oldPasswordController.text,
                            passwordConfirmation:
                                _confirmPasswordController.text));
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
