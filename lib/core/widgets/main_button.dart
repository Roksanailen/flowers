// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../app_text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    this.fontColor = Colors.white,
    this.fontSize = 22,
    required this.onTap,
    this.padding,
    this.color,
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final Color fontColor;
  final double fontSize;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: color != null ? MaterialStateProperty.resolveWith((states) => Colors.transparent) : null,
          backgroundColor: MaterialStateProperty.resolveWith((states) => color ?? Theme.of(context).primaryColor),
          minimumSize: MaterialStateProperty.resolveWith(
            (state) => Size(
              width,
              height,
            ),
          ),
          shape: MaterialStateProperty.resolveWith(
            (state) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: AppTextStyles.normal(
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
