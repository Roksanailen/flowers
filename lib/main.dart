import 'package:flutter/material.dart';
import 'AccountScreen/theme_service.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'features/splash/presentation/SplashView.dart';

void main() async {
  await GetStorage .init();

  runApp(const flowersMarket());
}

class flowersMarket extends StatelessWidget {
  const flowersMarket({Key? key}) : super(key: key);

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
