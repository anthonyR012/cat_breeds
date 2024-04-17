import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/config/functions/navigator_widgets_function.dart';
import 'package:catbreeds/src/list_cats_page/list_cats_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initEnvironment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "$pathManagementJson$animationCat",
            errorBuilder: (context, error, stackTrace) {
              print(error);
              return SizedBox();
            },
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.9,
            fit: BoxFit.fill,
          ),
          const Text(
            titleApp,
            style: TextStyle(
                fontFamily: fontFamilyMontserrat,
                fontSize: h1Size,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _initEnvironment() async {
    if (!Env.isAlreadyInyected) await Env.initEnviroment();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _goToListCats();
      });
    });
  }

  void _goToListCats() {
    pushReplacementWidget(const ListCatsPage(), context);
  }
}
