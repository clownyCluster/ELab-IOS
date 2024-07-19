import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../ApiModel/about_us_model.dart';

class AboutUsState extends ChangeNotifier {
  AboutUsState() {
    getAboutUs();
  }
  Dio dio = Dio();
  AboutUsModel? aboutUSResponse;
  bool isLoading = false;

  getAboutUs() async {
    try {
      isLoading = true;
      notifyListeners();
      var response =
          await dio.get('https://beta.elabnepal.com/api/v1/about-us',options: Options(
            headers: {
              'apikey':'elab-ktmrush-api-v1-2023',
            }
          ));
      aboutUSResponse = AboutUsModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    isLoading = false;
    notifyListeners();
  }
}
