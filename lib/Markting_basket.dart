import 'package:flutter/material.dart';
import 'Production.dart';
import 'package:get/get.dart';
class Markting_basket extends StatelessWidget {
  const Markting_basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Column(
           children: [
          const SizedBox(
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
          const SizedBox(
               height: 75,
               width: 75,

             ),
             Container(
               child: InkWell
                 (onTap: (){
                  Get.to(const Production());
               }
                 ,

                child: const Text(
                  'Start shopping',
                  style: TextStyle(fontSize: 20),
                )),
             )
           ],


         ),





    );
  }
}