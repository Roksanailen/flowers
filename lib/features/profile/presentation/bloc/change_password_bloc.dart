import 'package:bloc/bloc.dart';
import 'package:flowers/core/global_functions.dart';
import 'package:flowers/features/profile/requests/profile_requests.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordState()) {
    on<ChangeUserPasswordEvent>((event, emit) async {
      emit(state.copyWith(status: ChangePasswordStats.loading));
      final result = await ProfileRepository().changePassword(
          event.oldPassword, event.password, event.passwordConfirmation);
      result.fold(
          (l) => emit(state.copyWith(status: ChangePasswordStats.failed)), (r) {
        GlobalFunctions().setUserInfo(user: r.user, accessToken: r.jwt);
        emit(state.copyWith(status: ChangePasswordStats.success));
      });
    });
  }
}
