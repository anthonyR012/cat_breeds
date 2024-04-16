import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/src/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: titleApp,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
