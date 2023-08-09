import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class profileEdit extends StatelessWidget {
  const profileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 40),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/flower.jpg") ,
                ),
                SizedBox(
                  height:20,
                ),
              itemprofile('Name', 'roksan',CupertinoIcons.person),
                SizedBox(height: 14),
                itemprofile('phone', '0941845129',CupertinoIcons.phone),
                SizedBox(height: 14),
                itemprofile('password', '******',CupertinoIcons.padlock),
                SizedBox(height: 14),
                itemprofile('Email', 'roroksan@gmail.com',CupertinoIcons.mail),

                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                        padding: EdgeInsets.all(15),),

                      child: Text('Edit profile',style: TextStyle(
                        color: Colors.black
                      ),),

                  ),
                ),
                SizedBox(height: 40,)
              ],

            )
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
      boxShadow: [ BoxShadow(
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
      trailing: Icon(Icons.arrow_forward,color: Colors.grey.shade400),

    ),
  );
}