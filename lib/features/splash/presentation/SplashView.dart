import 'package:flutter/material.dart';
import 'package:flutter_appflowers/features/splash/presentation/widget/bodysplash.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe8c2e2),
     body: bodysplash(),
      

    );
  }
}
