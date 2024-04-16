import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:flutter/material.dart';

SnackBar getSnackBarBottonCustom(BuildContext context, Widget content,
    {
      Duration duration = const Duration(seconds: 3),
      double marginSnack = 15,
      ShapeBorder? border,
    }) {

  return SnackBar(
    margin: EdgeInsets.only(left: marginSnack, right: marginSnack),
    behavior: SnackBarBehavior.floating,
    content: content,
    duration: duration,
    shape: border ?? const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28)),
        side: BorderSide(width: 0.5, color: whiteColorTheme)),
    padding: EdgeInsets.zero,
  );
}
