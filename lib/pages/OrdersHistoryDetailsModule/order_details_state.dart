import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../constant/constant.dart';
import '../../service/local_storage_service.dart';

class OrderDetailsState extends ChangeNotifier {
  int? orderId;
  OrderDetailsState(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      orderId = args as int?;
      notifyListeners();
    }
    getDetailsOrders();
    checkInternetConnection();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  Dio dio = Dio();
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  bool isLoading = false;
  setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Map<String, dynamic> order = {};

  getDetailsOrders() async {
    try {
      setLoading(true);
      var response = await dio.get(
        'base_url/order_detail/$orderId',
        options: Options(headers: {
          'apikey': 'elab-ktmrush-api-v1-2023',
          'Authorization': 'Bearer $token',
        }),
      );
      order = response.data['data'] as Map<String, dynamic>;
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
