import 'package:flutter/material.dart';

import '../../cart/presentation/markting_basket.dart';
import '../../products/presentation/store_screen.dart';
import 'myhome.dart';

class MainScreen extends StatelessWidget {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final screens = [
    const Myhome(),
    const MarktingBasket(),
    const StoreScreen(),
  ];

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, int value, _) => Scaffold(
        body: IndexedStack(
          index: value,
          children: screens,
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              unselectedFontSize: 0.0,
              selectedFontSize: 14.0,
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.pink.shade100,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              currentIndex: selectedIndex.value,
              onTap: (index) {
                selectedIndex.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Color.fromRGBO(255, 205, 239, 1.0),
                    ),
                    label: 'Myhome',
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket, color: Color.fromRGBO(255, 220, 244, 1.0)),
                    label: 'Markting_basket',
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: Icon(Icons.production_quantity_limits, color: Color.fromRGBO(253, 217, 244, 1.0)),
                    label: 'Production',
                    backgroundColor: Colors.grey),
              ],
            );
          },
        ),
      ),
    );
  }
}
