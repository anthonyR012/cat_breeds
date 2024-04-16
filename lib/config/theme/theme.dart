import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:flutter/material.dart';

const _snackBarTheme = SnackBarThemeData(
  backgroundColor: primaryColorTheme,
  contentTextStyle: TextStyle(
      color: whiteColorTheme,
      fontFamily: fontFamilyHind,
      fontSize: messageSize),
);

final _borderNoSelected = OutlineInputBorder(
    borderRadius: BorderRadius.circular(rounded28),
    borderSide: const BorderSide(
      width: 1,
      style: BorderStyle.solid,
    ));

final _borderSelected = OutlineInputBorder(
    borderRadius: BorderRadius.circular(rounded28),
    borderSide: const BorderSide(
      width: 1,
      style: BorderStyle.solid,
    ));

const _floatingLigth =
    FloatingActionButtonThemeData(backgroundColor: secondaryColorTheme);

final _imputLigth = InputDecorationTheme(
  enabledBorder: _borderNoSelected,
  focusedBorder: _borderSelected,
  fillColor: appBarColorTheme,
  filled: true,
  contentPadding: const EdgeInsets.all(paddingInput15),
  labelStyle: const TextStyle(color: grayTextColorTheme),
);

const _iconLigth = IconThemeData(color: secondaryColorTheme);
const _appBarLigth = AppBarTheme(
  color: appBarColorTheme,
);

final _elevatedButton = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(whiteColorTheme),
    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: h3Size)),
  ),
);
// Theme ligth
final ligthTheme = ThemeData(
    appBarTheme: _appBarLigth,
    snackBarTheme: _snackBarTheme,
    scaffoldBackgroundColor: backgroundColorTheme,
    floatingActionButtonTheme: _floatingLigth,
    elevatedButtonTheme: _elevatedButton,
    inputDecorationTheme: _imputLigth,
    iconTheme: _iconLigth);
