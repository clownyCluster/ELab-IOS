import 'package:dio/dio.dart';
import 'package:elab/ApiModel/covide_model.dart';
import 'package:flutter/material.dart';

class CovideState extends ChangeNotifier {
  CovideState() {
    getCovide();
  }
  Dio dio = Dio();
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  CovideModel? covideResponse;

  getCovide() async {
    try {
      setLoading(true);
      var response = await dio.get('https://beta.elabnepal.com/api/v1/covid',
          options: Options(headers: {
            "apikey": "elab-ktmrush-api-v1-2023",
          }));
      covideResponse = CovideModel.fromJson(response.data);

      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print('yo error ho');
    }
    setLoading(false);
  }
}
