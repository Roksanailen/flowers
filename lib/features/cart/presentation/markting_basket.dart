import 'package:flutter/material.dart';
import 'order_placed_screen.dart';
import '../../../production.dart';
import 'package:get/get.dart';

class MarktingBasket extends StatelessWidget {
  const MarktingBasket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 130,
            width: 130,
          ),
          Center(
            child: Image.asset(
              'assets/images/an.png',
              fit: BoxFit.contain,
              height: 280,
              width: 280,
            ),
          ),
          const SizedBox(
            height: 75,
            width: 75,
          ),
          InkWell(
              onTap: () {
                Get.to(const OrderPlacedScreen());
              },
              child: const Text(
                'Start shopping',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
