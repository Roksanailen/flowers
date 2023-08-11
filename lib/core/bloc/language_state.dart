part of 'language_bloc.dart';

enum LanguageManagerStatus {
  init,
  succ,
  isChange,
  loading,
  falied,
}

class LanguageState {
  final Locale? locale;
  final LanguageManagerStatus status;
  const LanguageState({
    this.locale,
    this.status = LanguageManagerStatus.init,
  });
  LanguageState copyWith({
    Locale? locale,
    LanguageManagerStatus? status,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
      status: status ?? this.status,
    );
  }
}
