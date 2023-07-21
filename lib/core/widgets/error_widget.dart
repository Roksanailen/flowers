import 'package:flutter/material.dart';

import '../app_text_styles.dart';
import 'main_button.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    Key? key,
    required this.onTap,
    this.color,
    this.textColor,
  }) : super(key: key);

  final void Function() onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   SvgPath.networkError,
          //   width: size.width * .25,
          // ),
          SizedBox(height: MediaQuery.of(context).size.width * .02),
          Text(
            'خطأ',
            style: AppTextStyles.bold(
              color: Colors.grey.shade400,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            // height: 30,
            child: FittedBox(
              child: MainButton(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(5),
                title: 'أعد المحاولة',
                fontColor: textColor ?? Colors.white,
                color: color,
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
