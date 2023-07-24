// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_service_bloc.dart';

class ThemeServiceState {
  final bool isDarkTheme;

  ThemeServiceState({
    this.isDarkTheme = false,
  });

  ThemeServiceState copyWith({
    bool? isDarkTheme,
  }) {
    return ThemeServiceState(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}

class ThemeService {
  ThemeService._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    backgroundColor: Colors.grey[200],
    scaffoldBackgroundColor: const Color.fromRGBO(246, 192, 215, 0.9294117647058824),
    appBarTheme: const AppBarTheme(color: Colors.white70),
    iconTheme: const IconThemeData(color: Colors.black87),
  );

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pinkAccent,
      backgroundColor: const Color.fromRGBO(114, 46, 73, 0.9294117647058824),
      scaffoldBackgroundColor: const Color.fromRGBO(175, 138, 155, 0.9294117647058824),
      appBarTheme: const AppBarTheme(color: Colors.purpleAccent),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(unselectedItemColor: Color.fromRGBO(175, 138, 155, 0.9294117647058824)));
}
