import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
      {super.key, required this.title, required this.content, this.icon});
  final String title;
  final String content;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.start,
        TextSpan(children: [
          if (icon != null)
            WidgetSpan(
              child: Icon(
                icon,
                size: 20,
                color: primaryColorTheme,
              ),
            ),
          TextSpan(
            text: icon != null ? ' $title ' : title,
            style: const TextStyle(
                color: primaryColorTheme,
                fontSize: h3Size,
                fontWeight: FontWeight.bold,
                fontFamily: fontFamilyMontserrat),
          ),
          TextSpan(
            text: content,
            style: const TextStyle(
                color: grayTextColorTheme,
                fontSize: h3Size,
                fontFamily: fontFamilyHind),
          ),
        ]));
  }
}
