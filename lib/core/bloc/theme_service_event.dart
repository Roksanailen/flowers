part of 'theme_service_bloc.dart';

abstract class ThemeServiceEvent {
  const ThemeServiceEvent();
}

class ChangeThemeEvent extends ThemeServiceEvent {}

class InitThemeEvent extends ThemeServiceEvent {}
