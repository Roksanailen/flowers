import 'package:flowers/core/global_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/models/user_model.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder<User>(
              future: GlobalFunctions().getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const SizedBox(height: 40),
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("assets/images/flower.jpg"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      itemprofile('Name', snapshot.requireData.username,
                          CupertinoIcons.person),
                      const SizedBox(height: 14),
                      itemprofile('phone', snapshot.requireData.phone,
                          CupertinoIcons.phone),
                      const SizedBox(height: 14),
                      itemprofile('Email', snapshot.requireData.email,
                          CupertinoIcons.mail),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white70,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(
                            'Edit profile',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white70,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(
                            'My Orders',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
        ],
      ),
    );
  }
}

itemprofile(String title, String subtitle, IconData iconData) {
  return Container(
    height: 60,
    width: 350,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 5),
          color: Colors.grey,
          spreadRadius: 2,
          blurRadius: 10,
        )
      ],
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
    ),
  );
}