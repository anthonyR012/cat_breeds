import 'package:catbreeds/config/env/environment.dart';
import 'package:catbreeds/device/connectivity/network_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';



Future<void> initOverallInjection() async {
  // Petition to the project per Dio
  Dio dioHttp = Dio();
  dioHttp.options = BaseOptions(validateStatus: (status) => true);
  Env.sl.registerLazySingleton(() => dioHttp);
  //network info
  final stateNetwork = NetworkState(Connectivity());
  stateNetwork.watchConnectionState();
  Env.sl.registerLazySingleton(() => stateNetwork);
}
