import 'package:bloc/bloc.dart';
import 'package:flowers/core/global_functions.dart';
import 'package:flowers/features/auth_screens/requests/auth_requests.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>((LoginEvent event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      final result =
          await AuthRepository().login(event.userName, event.password);
      result.fold((l) => emit(state.copyWith(status: AuthStatus.failed)), (r) {
        emit(state.copyWith(status: AuthStatus.success));
        GlobalFunctions().setUserInfo(user: r.user, accessToken: r.jwt);
      });
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      final result = await AuthRepository().register(
          username: event.username,
          password: event.password,
          email: event.email,
          phone: event.phone);
      result.fold((l) => emit(state.copyWith(status: AuthStatus.failed)), (r) {
        emit(state.copyWith(status: AuthStatus.success));
        GlobalFunctions().setUserInfo(user: r.user, accessToken: r.jwt);
      });
    });
  }
}
