import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  List<Locale> supportedLocales = [
    const Locale('ar', 'ar'),
    const Locale('en', 'en'),
  ];
  LanguageBloc() : super(const LanguageState()) {
    on<ToggleLanguageEvent>(_mapChangeLanguageState);

    on<InitLanguageEvent>(_mapInitLanguageState);
  }

  FutureOr<void> _mapInitLanguageState(
      InitLanguageEvent event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(status: LanguageManagerStatus.loading));
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey('languageApp')) {
      emit(
        state.copyWith(
          status: LanguageManagerStatus.succ,
          locale: Locale(pref.getString('languageApp')!),
        ),
      );
    } else {
      String localeName = Platform.localeName;
      for (var item in supportedLocales) {
        if (localeName.startsWith(item.languageCode)) {
          pref.setString('languageApp', item.languageCode);
          emit(
            state.copyWith(
              locale: item,
              status: LanguageManagerStatus.succ,
            ),
          );
        }
      }
    }
    emit(
      state.copyWith(
        locale: const Locale('ar', ''),
        status: LanguageManagerStatus.succ,
      ),
    );
  }

  FutureOr<void> _mapChangeLanguageState(
      ToggleLanguageEvent event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(status: LanguageManagerStatus.loading));
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(
        'languageApp', state.locale?.languageCode == 'ar' ? 'en' : 'ar');
    emit(
      state.copyWith(
        status: LanguageManagerStatus.isChange,
        locale: state.locale?.languageCode == 'ar'
            ? const Locale('en')
            : const Locale('ar'),
      ),
    );
    emit(state.copyWith(status: LanguageManagerStatus.init));
  }
}
