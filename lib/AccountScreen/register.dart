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
                   margin: const EdgeInsets.only(top: 40,right: 40),
                   alignment: Alignment.center,
                   child: const Text('Register a new account', style: TextStyle(fontSize: 25,color: Colors.black87),),
                 ),
                  const SizedBox(
                   height: 30,
                 ),
                 TextFormField(
                   decoration:  InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                       ),
                       hintText: 'Enter your username',hintStyle: TextStyle(
                     color: Colors.black26,
                   )

                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration:  InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(  borderRadius: BorderRadius.circular(30),),
                       hintText: 'Enter your email  ',hintStyle: TextStyle(
                     color: Colors.black26,
                   )

                   ),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration:  InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(  borderRadius: BorderRadius.circular(30),),
                       hintText: 'Enter your phone',hintStyle: TextStyle(
                     color: Colors.black26,

                   ),
                 ),),

                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration:  InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(  borderRadius: BorderRadius.circular(30),),
                       hintText: 'Enter your password ',hintStyle: TextStyle(
                     color: Colors.black26,

                   ),)
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration:  InputDecoration(
                       filled: true,
                       fillColor: Colors.white,
                       border: OutlineInputBorder(  borderRadius: BorderRadius.circular(30),),
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

                     child:  Center(
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: Colors.white
                         ),
                         onPressed: () {},
                         child: Text('register',style: TextStyle(
                           fontSize: 20,color: Colors.black87
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
