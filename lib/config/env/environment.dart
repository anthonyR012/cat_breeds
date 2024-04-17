
import 'package:catbreeds/di/overall_dependency.dart';
import 'package:catbreeds/di/unique_dependency.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
class Env {
  static GetIt sl  = GetIt.instance;
  static bool isAlreadyInyected = false;

  static initEnviroment() async {
    // init 
    await dotenv.load();
    await initOverallInjection();
    await injectionModules();
    await sl.allReady();
    isAlreadyInyected = !isAlreadyInyected;
  }

}