part of 'language_bloc.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent {}

class InitLanguageEvent extends LanguageEvent {}
