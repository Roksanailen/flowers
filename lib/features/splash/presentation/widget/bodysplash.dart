

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appflowers/Navigationbar.dart';
import 'package:get/get.dart';
import 'package:flutter_appflowers/Myhome.dart';
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
  animationController= AnimationController(vsync:this,duration: Duration(milliseconds: 400));
  fadingAnamation=Tween<double>(begin: .2,end: 10).animate(animationController!);
  animationController?.repeat(reverse: true);
    goToNextView();
}
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Spacer(),
       FadeTransition(
              opacity: fadingAnamation!,
              child:
              Text('Flowers Market',style: TextStyle(
                fontSize: 41,
                color: const Color(0xffefebeb),
                fontWeight: FontWeight.normal,
              ),),
            ),

          Spacer(),
          Image.asset('assets/images/bs.jpg')
          
        ],
      ),
    );

    }

  void goToNextView() {
  Future.delayed(Duration(seconds: 5),(){
    Get.to(()=>Navigationbar(),transition: Transition.fade);});
}
}


