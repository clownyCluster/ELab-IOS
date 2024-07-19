import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../ApiModel/teams_model.dart';
import '../../constant/constant.dart';

class TeamsState extends ChangeNotifier {
  TeamsState() {
    getTeams();
  }
  Dio dio = Dio();
  TeamsModel? teamsResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  getTeams() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/teams',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      teamsResponse = TeamsModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
