import 'package:flutter/material.dart';
import 'package:flutter_appflowers/Markting_basket.dart';
import 'package:flutter_appflowers/Myhome.dart';
import 'package:flutter_appflowers/controller/bottom_navigation_controller.dart';
import 'package:flutter_appflowers/profile.dart';
import 'package:flutter_appflowers/Production.dart';
import 'package:get/get.dart';
class Navigationbar extends StatelessWidget {
  int index=0;
  BottomNavigationController bottomNavigationController=
  Get.put(BottomNavigationController());
  final Screens=[
    Myhome(),
    profile(),
    Markting_basket(),
    Production(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Scaffold(
      body: IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children:Screens,
        ),

        bottomNavigationBar:Builder(
          builder: (context) {
            int index;
            return BottomNavigationBar(

              unselectedFontSize: 0.0,
              selectedFontSize: 14.0,
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.pink.shade100,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex:bottomNavigationController.selectedIndex.value,

             onTap : (index) {
                bottomNavigationController.changIndex(index);
              },

              items: [
                BottomNavigationBarItem(icon:Icon(Icons.home ,color: Color.fromRGBO(
               255, 205, 239, 1.0),),label: 'Myhome'
                , backgroundColor: Colors.white70),
                BottomNavigationBarItem(icon:Icon(Icons.account_circle,color:
                Color.fromRGBO(
                    248, 203, 236, 1.0)),label: 'profile'
                    ,backgroundColor: Colors.white70),


      BottomNavigationBarItem(icon:Icon(Icons.shopping_basket,color: Color.fromRGBO(
          255, 220, 244, 1.0)),label: 'Markting_basket'
      ,backgroundColor:  Colors.white70),
      BottomNavigationBarItem(icon:Icon(Icons.production_quantity_limits,color: Color.fromRGBO(
          253, 217, 244, 1.0)),label: 'Production'
      ,backgroundColor: Colors.white70),
      ] ,

            );},
        ),
      ),
    );
  }
}
