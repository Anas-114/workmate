import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/usecases/check_connectivity.dart';

class ConnectivityProvider extends ChangeNotifier {
  final CheckConnectivity checkConnectivity;
  bool _isConnected = true;

  ConnectivityProvider({required this.checkConnectivity}) {
    // Initial check
    checkConnectivity.call().then((value) {
      _isConnected = value;
      notifyListeners();
    });

    // Listen for changes
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // Check if any of the connectivity results are not 'none'
      _isConnected = !results.contains(ConnectivityResult.none);
      notifyListeners();
    });
  }

  bool get isConnected => _isConnected;
}