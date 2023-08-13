part of 'change_password_bloc.dart';

enum ChangePasswordStats { loading, success, failed, init }

class ChangePasswordState {
  final ChangePasswordStats status;
  const ChangePasswordState({
    this.status = ChangePasswordStats.init,
  });

  ChangePasswordState copyWith({
    ChangePasswordStats? status,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
    );
  }
}
