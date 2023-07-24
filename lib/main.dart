import 'package:bot_toast/bot_toast.dart';
import 'package:flowers/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<ThemeServiceBloc, ThemeServiceState>(
      bloc: serviceLocator<ThemeServiceBloc>()..add(InitThemeEvent()),
      builder: (context, state) {
        return MaterialApp(
          builder: BotToastInit(),
          theme: state.isDarkTheme ? ThemeService.darkTheme : ThemeService.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
