import 'package:catbreeds/config/constant/end_point_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/device/connectivity/network_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initOverallInjection() async {
  // Petition to the project per Dio
  Dio dioHttp = Dio();
  dioHttp.options = BaseOptions(validateStatus: (status) => true);
  Env.sl.registerLazySingleton(() => dioHttp);
  //network info
  final stateNetwork = NetworkState(Connectivity());
  stateNetwork.watchConnectionState();
  Env.sl.registerLazySingleton(() => stateNetwork);
  //cat endpoint
  Env.sl.registerLazySingleton<CatEndPoint>(
      () => CatEndPoint(baseUrl: dotenv.env[keyCatEndPoint] ?? ""));
}
