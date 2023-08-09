import 'package:flowers/core/global_functions.dart';
import 'package:flowers/features/profile/presentation/profile.dart';
import 'package:flowers/features/profile/presentation/profileEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GlobalFunctions().isAuth(),
      builder: (context ,  snapshot) {
      if (snapshot==false)
    {
        return profileEdit();
  }else
    {return  ProfileScreen();}}
    );
  }
  }

