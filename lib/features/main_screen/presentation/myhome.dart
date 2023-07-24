import 'package:flowers/core/bloc/theme_service_bloc.dart';
import 'package:flowers/core/global_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/main_text_failed.dart';
import '../../../dependency_injection.dart';

class Myhome extends StatelessWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const moonIcon = CupertinoIcons.moon_stars;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(
                moonIcon,
                color: Colors.black87,
              ),
              onPressed: () {
                serviceLocator<ThemeServiceBloc>().add(ChangeThemeEvent());
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: MainTextField(
                controller: TextEditingController(),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
        ));
  }
}
