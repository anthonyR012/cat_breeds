import 'package:flutter/material.dart';

const Color primaryColorTheme = Color(0xFFAAB3AB);
const Color secondaryColorTheme = Color(0xFFC4CBB7);
const Color whiteColorTheme = Color(0xFFFFFFFF);
const Color blackColorTheme = Color(0xFF000000);
const Color backgroundColorTheme = Color(0xFFFAFAFA);
const Color grayTextColorTheme = Color(0xFF858585);
const Color appBarColorTheme = Color(0xFF091522);
const Color borderColorTheme = Color(0xFF3A3A42);
const Color borderColorActiveTheme = Color(0xFFFFFFFF);
Color linearColorTheme = const Color(0xFF176FF2).withOpacity(0.5);

final LinearGradient glamGradientTheme = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
  const Color(0xFF028D92),
  const Color(0xFF037D80).withOpacity(0.95),
  const Color(0xFF026D6E).withOpacity(0.8),
  const Color(0xFF025E5E).withOpacity(0.6),
  ],
);
const LinearGradient darkStrongGradientTheme = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(30, 0, 0, 0),
    Color.fromARGB(0, 0, 0, 0),
    Color.fromARGB(20, 255, 255, 255),
  ],
);
