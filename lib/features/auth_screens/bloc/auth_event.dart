// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class RegisterEvent extends AuthEvent {
  final String phone;
  final String password;
  final String email;
  final String username;
  RegisterEvent({
    required this.phone,
    required this.password,
    required this.email,
    required this.username,
  });
}

class LoginEvent extends AuthEvent {
  final String userName;
  final String password;
  LoginEvent({
    required this.userName,
    required this.password,
  });
}
