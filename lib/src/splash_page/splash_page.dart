
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              "$pathManagementJson$animationCat",
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
              onLoaded: (value) {
                Future.delayed(value.duration, _goToListCats);
              },
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
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
      ),
    );
  }

  void _initEnvironment() async {
    if (!Env.isAlreadyInyected) await Env.initEnviroment();
  }

  void _goToListCats() {
    pushReplacementWidget(const ListCatsPage(), context);
  }
}
