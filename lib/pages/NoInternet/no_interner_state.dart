
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { wiFi, cellular, offline }

class ConnectivityProvider with ChangeNotifier {
  ConnectivityStatus statusResponse = ConnectivityStatus.offline;
  Connectivity? connectivityResponse;

  ConnectivityProvider() {
    connectivityResponse = Connectivity();

    connectivityResponse!.onConnectivityChanged.listen(updateStatus as void Function(List<ConnectivityResult> event)?);
    print('yo wifi ko status ho ${ConnectivityResult.wifi}');
  }

  ConnectivityStatus get status => statusResponse;

  void updateStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      statusResponse = ConnectivityStatus.wiFi;
    } else if (result == ConnectivityResult.mobile) {
      statusResponse = ConnectivityStatus.cellular;
    } else {
      statusResponse = ConnectivityStatus.offline;
    }
    notifyListeners();
  }

  
}
