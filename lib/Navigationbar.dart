import 'package:flutter/material.dart';
import 'Markting_basket.dart';
import 'Myhome.dart';
import 'controller/bottom_navigation_controller.dart';
import 'profile.dart';
import 'Production.dart';
import 'package:get/get.dart';
class Navigationbar extends StatelessWidget {
  int index=0;
  BottomNavigationController bottomNavigationController=
  Get.put(BottomNavigationController());
  final Screens=[
    const Myhome(),
    const profile(),
    const Markting_basket(),
    const Production(),
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

              items: const [
                BottomNavigationBarItem(icon:Icon(Icons.home ,color: Color.fromRGBO(
               255, 205, 239, 1.0),),label: 'Myhome'
                , backgroundColor: Colors.grey),
                BottomNavigationBarItem(icon:Icon(Icons.account_circle,color:
                Color.fromRGBO(
                    248, 203, 236, 1.0)),label: 'profile'
                    ,backgroundColor: Colors.grey),


      BottomNavigationBarItem(icon:Icon(Icons.shopping_basket,color: Color.fromRGBO(
          255, 220, 244, 1.0)),label: 'Markting_basket'
      ,backgroundColor:  Colors.grey),
      BottomNavigationBarItem(icon:Icon(Icons.production_quantity_limits,color: Color.fromRGBO(
          253, 217, 244, 1.0)),label: 'Production'
      ,backgroundColor: Colors.grey),
      ] ,

            );},
        ),
      ),
    );
  }
}
