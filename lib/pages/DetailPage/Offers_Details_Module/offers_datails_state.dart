import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../ApiModel/offers_details_model.dart';
import '../../../constant/constant.dart';

class OffersDetailsState extends ChangeNotifier {
  OffersDetailsState(context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    if (args != null) {
      slug = args;
    }
    getOffersDetails();
  }
  String? slug;
  Dio dio = Dio();
  OffersDetailsModel? offersDetailsResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  getOffersDetails() async {
    setLoading(true);
    try {
      var response = await dio.get('$base_url/offer/$slug',
          options: Options(headers: {'apikey': 'elab-ktmrush-api-v1-2023'}));
      offersDetailsResponse = OffersDetailsModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
