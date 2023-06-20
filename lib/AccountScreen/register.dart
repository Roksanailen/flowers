import 'package:flutter/material.dart';
class registerscreen extends StatelessWidget {
  const registerscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
             child: Column(
               children: [
                 Container(
                   margin: const EdgeInsets.only(top: 30),
                   alignment: Alignment.center,
                   child: const Text('Register a new account', style: TextStyle(fontSize: 25,color: Colors.white),),
                 ),
                  const SizedBox(
                   height: 40,
                 ),
                 TextFormField(
                   decoration: const InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(),
                       hintText: 'Enter your username',hintStyle: TextStyle(
                     color: Colors.black26,
                   )

                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration: const InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(),
                       hintText: 'Enter your email  ',hintStyle: TextStyle(
                     color: Colors.black26,
                   )

                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration: const InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(),
                       hintText: 'Enter your phone',hintStyle: TextStyle(
                     color: Colors.black26,

                   ),
                 ),),

                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration: const InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(),
                       hintText: 'Enter your password ',hintStyle: TextStyle(
                     color: Colors.black26,

                   ),)
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration: const InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(),
                       hintText: 'confirm password'
                     ,hintStyle: TextStyle(
                     color: Colors.black26,
                   )
                   ),
                 ),
                 const SizedBox(
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
                       child: Text('register',style: TextStyle(
                         fontSize: 20,color: Color.fromRGBO(252, 207, 225, 0.9294117647058824),
                       ),),
                     ),
                   ),
                 ),
                 const SizedBox(
                   height: 15,
                 ),
                   ],
                 )

             ),),
          ),
        );

  }
}
