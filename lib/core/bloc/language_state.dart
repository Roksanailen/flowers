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
  final String languageCode;
  final LanguageManagerStatus status;
  const LanguageState({
    this.locale,
    this.languageCode = 'ar',
    this.status = LanguageManagerStatus.init,
  });
  LanguageState copyWith({
    Locale? locale,
    String? languageCode,
    LanguageManagerStatus? status,
  }) {
    return LanguageState(
      languageCode: languageCode ?? this.languageCode,
      locale: locale ?? this.locale,
      status: status ?? this.status,
    );
  }
}
