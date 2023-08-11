import 'package:flowers/core/global_functions.dart';
import 'package:flowers/features/profile/presentation/profile.dart';
import 'package:flowers/features/profile/presentation/profileEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: GlobalFunctions().isAuth(),
      builder: (context ,  snapshot) {
      if (snapshot.data??true)
    {
        return const ProfileEdit();
  }else
    {return  const ProfileScreen();}}
    );
  }
  }

