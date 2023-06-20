

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Navigationbar.dart';
class bodysplash extends StatefulWidget {
  const bodysplash({Key? key}) : super(key: key);

  @override
  State<bodysplash> createState() => _bodysplashState();
}

class _bodysplashState extends State<bodysplash> with SingleTickerProviderStateMixin{
  AnimationController ? animationController;
  Animation <double>? fadingAnamation;
  
  @override
  void initState(){
  super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  fadingAnamation=Tween<double>(begin: .2,end: 10).animate(animationController!);
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
    return Container(
      child: Column(
        children: [

          const Spacer(),
       FadeTransition(
              opacity: fadingAnamation!,
              child:
              const Text(
              'Flowers Market',
              style: TextStyle(
                fontSize: 41,
                color: Color(0xffefebeb),
                fontWeight: FontWeight.normal,
              ),),
            ),

          const Spacer(),
          Image.asset('assets/images/bs.jpg')
          
        ],
      ),
    );

    }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 5), () {
    Get.to(()=>Navigationbar(),transition: Transition.fade);});
}
}


