import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appflowers/AccountScreen/register.dart';
import 'package:flutter_appflowers/controller/Login.dart';
import 'package:flutter_appflowers/password.dart';
import 'package:get/get.dart';
class login extends StatelessWidget {

  LoginController controller =Get .put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(
            ()=> Scaffold(
        backgroundColor: Color.fromRGBO(252, 207, 225, 0.9294117647058824),
         body: SafeArea(
           child: SingleChildScrollView(
             child: Padding(padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
             child: Column(
               children: [
                 Container(alignment: Alignment.center,
                   child:Image.asset('assets/images/profile.png',
                   fit: BoxFit.cover,
                     height: 230,
                       width: 180,
                   ),
                 ),
                  const SizedBox(
                    height: 40,
                 ),
                const Text('Username', style: TextStyle(
                  fontSize: 20,color: Colors.white
                ),),
               const SizedBox(
                 height: 30,
               ),
               TextFormField(
                 controller: controller.usernameController.value,
                 decoration: InputDecoration(
                 filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                   hintText: 'Enter a username  ',hintStyle: TextStyle(
                   color: Colors.black26,
                 )

               )


             ),
                 const SizedBox(
                   height: 40,
                 ),
                 const Text('Password', style: TextStyle(
                     fontSize: 20,color: Colors.white
                 ),),
                 const SizedBox(
                   height: 30,
                 ),
                 TextField(
                   controller: controller.passwordController.value,
                     decoration: InputDecoration(
                        filled: true,
                         fillColor: Colors.white,
                         border: OutlineInputBorder(),
                         hintText: 'Enter a password',hintStyle: TextStyle(
                       color: Colors.black26,
                     )
                     ),
                 ),
                 SizedBox(
                   height: 30,
                 ),
                 Center(
                   child: Container(
                     decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                       color: Colors.white,
                     ),
                     height: 45,
                       width: 90,
                     child: const Center(
                       child: Text('Login',style: TextStyle(
                         fontSize: 20,color:  Color.fromRGBO(252, 207, 225, 0.9294117647058824),
                       ),),
                     ),
                   ),
                 ),
                const SizedBox(
                   height: 15,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    Text('Dont have an account?', style: TextStyle(fontSize: 15,color: Colors.white),),
                     InkWell(
                       onTap: (){
                              Get.to( const registerscreen()) ;     },

                         child: const Text('register', style: TextStyle(fontSize: 15,color:Colors.black26),),),
                   ],
                 ),
             const SizedBox(
               height: 15,
             ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(' forget the password? ', style: TextStyle(fontSize: 15,color: Colors.white),),
                     InkWell(
                       onTap: (){
                         Get.to( const password()) ;     },

                       child: const Text('click here', style: TextStyle(fontSize: 15,color:Colors.black26),),),
                   ],
                 ),
                 const SizedBox(
                   height: 15,
                 ),
             ],
               
             ),),

             
             
             
           ),
           
         ),



      )
    );
  }
}
