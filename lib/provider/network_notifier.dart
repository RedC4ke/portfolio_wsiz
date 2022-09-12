import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkNotifier extends ChangeNotifier {
  String connectivityMessage = 'Loading...';
  String get getConnectivityMessage {
    return connectivityMessage;
  }

  final Stream<ConnectivityResult> subscription;

  NetworkNotifier() : subscription = Connectivity().onConnectivityChanged {
    subscription.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.bluetooth:
          connectivityMessage = 'Bluetooth';
          break;
        case ConnectivityResult.ethernet:
          connectivityMessage = 'Ethernet';
          break;
        case ConnectivityResult.mobile:
          connectivityMessage = 'Mobile';
          break;
        case ConnectivityResult.wifi:
          connectivityMessage = 'WiFi';
          break;
        default:
          connectivityMessage = 'none';
      }

      notifyListeners();
    });
  }
}
