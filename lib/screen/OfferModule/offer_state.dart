import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ApiModel/offers_model.dart';
import '../../constant/constant.dart';

class OfferState extends ChangeNotifier {
  OfferState() {
    getOffers();
    checkInternetConnection();
  }

  Dio dio = Dio();
  bool isLoading = false;
  OfferModel? offerModelResponse;
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

  getOffers() async {
    setLoading(true);
    try {
      var response = await dio.get('$base_url/offers',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      offerModelResponse = OfferModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
