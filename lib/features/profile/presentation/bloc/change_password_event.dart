part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class ChangeUserPasswordEvent extends ChangePasswordEvent {
  final String password;
  final String oldPassword;
  final String passwordConfirmation;
  ChangeUserPasswordEvent({
    required this.password,
    required this.oldPassword,
    required this.passwordConfirmation,
  });
}
