import 'package:dio/dio.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';

import '../../ApiModel/medical_reports_model.dart';

class HistoryState extends ChangeNotifier {
  HistoryState(context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    if (args['slug'] != null) {
      slug = args['slug'];
    }
    if (args['name'] != null) {
      name = args['name'];
    }
    getHistory();
  }
  String? slug;
  String? name;
  bool isExpanded = false;
  onExpandedChange() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  Dio dio = Dio();
  MedicalReportsModel? medicalReportsResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  getHistory() async {
    setLoading(true);
    try {
      var response = await dio.get('$base_url/medical-report/$slug',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);

      medicalReportsResponse = MedicalReportsModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
