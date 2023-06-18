import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appflowers/AccountScreen/theme_service.dart';
import 'package:flutter_appflowers/home_viewModel.dart';
import 'package:get/get.dart';
class Myhome extends StatelessWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const moonIcon= CupertinoIcons.moon_stars;
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       actions: [
         const SizedBox(
           width: 20,
         ),
         IconButton(icon: const Icon(moonIcon,color: Colors.black87,),
           onPressed: (){
                ThemeService.switchTheme();
           },
         )
       ],
     ),
        backgroundColor:Color.fromRGBO(250, 210, 226, 0.9294117647058824),
      body: Container(
        padding: EdgeInsets.only(top: 70,left: 20,right: 20),
        child: Column(
          children: [Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
              ),
            ),
          ),
]
    ),
    ));
}
}
