import 'package:catbreeds/config/routers/router.dart';
import 'package:flutter/material.dart';

void pushReplacementWidget(Widget goTo, BuildContext context,
    {int durationAnimation = 1000, Color colorAnimation = Colors.transparent}) {
  Navigator.of(context).pushReplacement(CustomPageRoute(
      builder: (_) => goTo,
      duration: durationAnimation,
      color: colorAnimation));
}
