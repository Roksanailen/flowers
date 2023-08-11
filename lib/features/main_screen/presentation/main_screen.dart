import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cart/presentation/my_orders.dart';
import '../../products/presentation/store_screen.dart';
import '../../profile/presentation/main_profile_screen.dart';
import 'myhome.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AppLocalizations appLocalizations;
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  final screens = [
    const Myhome(),
    const MyOrdersScreen(),
    const StoreScreen(),
    const MainProfileScreen(),
  ];
  @override
  void didChangeDependencies() {
    appLocalizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

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
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home,
                      color: Color.fromRGBO(255, 205, 239, 1.0),
                    ),
                    label: appLocalizations.myhome,
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_basket,
                        color: Color.fromRGBO(255, 220, 244, 1.0)),
                    label: appLocalizations.products,
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.production_quantity_limits,
                        color: Color.fromRGBO(253, 217, 244, 1.0)),
                    label: appLocalizations.myOrders,
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person_rounded,
                        color: Color.fromRGBO(253, 217, 244, 1.0)),
                    label: appLocalizations.profile,
                    backgroundColor: Colors.grey),
              ],
            );
          },
        ),
      ),
    );
  }
}
