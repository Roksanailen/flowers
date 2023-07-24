import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flowers/core/global_functions.dart';
import 'package:flutter/material.dart';

part 'theme_service_event.dart';
part 'theme_service_state.dart';

class ThemeServiceBloc extends Bloc<ThemeServiceEvent, ThemeServiceState> {
  ThemeServiceBloc() : super(ThemeServiceState()) {
    on<ChangeThemeEvent>((event, emit) async {
      final bool isDarkTheme = await GlobalFunctions().getTheme();
      emit(state.copyWith(isDarkTheme: !isDarkTheme));
      await GlobalFunctions().setTheme(isDarkMode: !isDarkTheme);
    });
    on<InitThemeEvent>((event, emit) async {
      final bool isDarkTheme = await GlobalFunctions().getTheme();
      log(isDarkTheme.toString());
      emit(state.copyWith(isDarkTheme: isDarkTheme));
    });
  }
}
