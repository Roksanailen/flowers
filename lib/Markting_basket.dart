import 'package:flutter/material.dart';
import 'package:flutter_appflowers/Production.dart';
import 'package:get/get.dart';
class Markting_basket extends StatelessWidget {
  const Markting_basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(250, 210, 226, 0.9294117647058824),
         body: Column(
           children: [
             SizedBox(
               height: 130,
               width: 130,

             )
             ,Container(
             child:Center(
             child: Image.asset('assets/images/an.png',
            fit: BoxFit.contain,
             height: 280,
             width: 280,
    ),
          ),),
             SizedBox(
               height: 75,
               width: 75,

             ),
             Container(
               child: InkWell
                 (onTap: (){
                   Get.to(Production());
               }
                 ,

                   child: Text('Start shopping',style: TextStyle(fontSize: 20 ),)),
             )
           ],


         ),





    );
  }
}