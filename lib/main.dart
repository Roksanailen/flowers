import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'core/theme_service.dart';
import 'features/splash/presentation/splash_view.dart';

void main() async {
  await GetStorage .init();

  runApp(const FlowersMarket());
}

class FlowersMarket extends StatelessWidget {
  const FlowersMarket({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeService.lightTheme,
      darkTheme: ThemeService.darkTheme,
      themeMode: ThemeService.theme,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );



  }



}
