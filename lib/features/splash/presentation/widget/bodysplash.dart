

import 'package:flutter/material.dart';
import '../../../../core/global_functions.dart';
import 'package:get/get.dart';

import '../../../auth_screens/presentation/login_screen.dart';
import '../../../main_screen/presentation/main_screen.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin {
  AnimationController ? animationController;
  Animation <double>? fadingAnamation;
  
  @override
  void initState(){
  super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fadingAnamation = Tween<double>(begin: 0, end: 1).animate(animationController!);
  animationController?.repeat(reverse: true);
    goToNextView();
}
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        FadeTransition(
          opacity: fadingAnamation!,
          child: const Text(
            'Flowers Market',
            style: TextStyle(
              fontSize: 41,
              color: Color(0xffefebeb),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),

        const Spacer(),
        Image.asset('assets/images/bs.jpg')
      ],
    );

    }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 2), () async {
      final isAuth = await GlobalFunctions().isAuth();
      Get.to(() => !isAuth ? LoginScreen() : MainScreen(), transition: Transition.fade);
    });
}
}


