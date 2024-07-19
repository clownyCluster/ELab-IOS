import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PaymentState extends ChangeNotifier {
  PaymentState() {
    checkInternetConnection();
  }
  bool ispayment = true;
  onPaymentChange(val) {
    ispayment = val;
    notifyListeners();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }
}
