import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<InternetConnectionStatus> get subscription;

}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionCheckerPlus connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  var isDeviceConnected = false;

  @override
  Stream<InternetConnectionStatus> get subscription =>
     InternetConnectionCheckerPlus().onStatusChange;
}
