import 'package:flutter/material.dart';
import 'package:flutter_appflowers/controller/Login.dart';
import 'package:flutter_appflowers/AccountScreen/Login.dart';
import 'package:get/get.dart';
class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(250, 210, 226, 0.9294117647058824),
      body: SafeArea(
          child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
        Container(

          child:Image.asset('assets/images/flower.jpg',
            fit: BoxFit.fitWidth,
          height: 300,
          width: 1000,
          ),
          ),

      const SizedBox(
        height: 20,
      ),
      const Text(' Welcome our valued customer', style: TextStyle(
          fontSize: 20,color: Colors.black87,
      ),),
      const SizedBox(
        height: 30,
      ),

    InkWell(
    onTap: (){
    Get.to( login()) ;     },
         child:  Container(
           height: 40,
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
           child: Center(
             child: Text('Create your Account', style: TextStyle(
                fontSize: 20,color:  Color.fromRGBO(252, 207, 225, 0.9294117647058824),
        ),),
           ),
         ),
      ),
      const SizedBox(
        height: 30,
      ),

],
    ),
    ),),
    ),);
  }
}
