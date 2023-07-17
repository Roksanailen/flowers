import 'package:flutter/material.dart';
import 'AccountScreen/Login.dart';
import 'package:get/get.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/flower.jpg',
                    fit: BoxFit.fitWidth,
                    height: 300,
                    width: 1000,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  ' Welcome our valued customer',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(login());
                  },
                  child: Container(
margin: EdgeInsets.all(40),
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Create your Account',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
