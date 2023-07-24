// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

enum AuthStatus { loading, success, failed, init }

class AuthState {
  final AuthStatus status;
  AuthState({
    this.status = AuthStatus.init,
  });

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }
}
