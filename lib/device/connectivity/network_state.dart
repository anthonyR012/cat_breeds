import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkState {
  final Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late ConnectivityResult _connectionStatus;

  NetworkState(this._connectivity);

  Future<void> watchConnectionState() async {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  get status => _connectionStatus;

  Future<void> closeWatchedConnection() async {
    _connectivitySubscription.cancel();
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus = result.first;
  }
}
