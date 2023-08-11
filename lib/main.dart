import 'package:bot_toast/bot_toast.dart';
import 'package:flowers/core/bloc/language_bloc.dart';
import 'package:flowers/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/bloc/theme_service_bloc.dart';
import 'features/splash/presentation/splash_view.dart';

void main() async {
  await init();
  runApp(const FlowersMarket());
}

class FlowersMarket extends StatelessWidget {
  const FlowersMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<LanguageBloc>()..add(InitLanguageEvent()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        bloc: serviceLocator<LanguageBloc>(),
        builder: (context, languageState) {
          return BlocBuilder<ThemeServiceBloc, ThemeServiceState>(
            bloc: serviceLocator<ThemeServiceBloc>()..add(InitThemeEvent()),
            builder: (context, state) {
              return MaterialApp(
                locale: languageState.locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                builder: BotToastInit(),
                theme: state.isDarkTheme
                    ? ThemeService.darkTheme
                    : ThemeService.lightTheme,
                debugShowCheckedModeBanner: false,
                home: const SplashView(),
              );
            },
          );
        },
      ),
    );
  }
}
