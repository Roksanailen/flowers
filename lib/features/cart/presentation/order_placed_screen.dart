import 'package:flutter/material.dart';
import '../../main_screen/presentation/main_screen.dart';
import 'package:get/get.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
                  ),
                  child: Image.asset('assets/basket.png')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your Order Is Placed Successfully',
                ),
              ),
              ElevatedButton(
                  child: Text('Go To Home'),
                  onPressed: () {
                    Get.offAll(MainScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
