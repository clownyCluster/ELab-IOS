import 'package:dio/dio.dart';
import 'package:elab/ApiModel/orders_model.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../constant/constant.dart';

class OrderState extends ChangeNotifier {
  OrderState() {
    getOrders();
    checkInternetConnection();
  }
  Dio dio = Dio();
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  OrderModel? orderResponse;
  // List order = [];

  getOrders() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/orders',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      orderResponse = OrderModel.fromJson(response.data);
      // order = response.data['data'];
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
