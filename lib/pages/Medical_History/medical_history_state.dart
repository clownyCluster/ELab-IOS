import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../ApiModel/medical_history_model.dart';
import '../../ApiModel/medical_reports_model.dart';
import '../../constant/constant.dart';
import '../../service/local_storage_service.dart';

class MedicalHistoryState extends ChangeNotifier {
  MedicalHistoryState() {
    getHistory();
  }
  Dio dio = Dio();
  MedicalHistoryModel? medicalReportsResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  getHistory() async {
    setLoading(true);
    try {
      var response = await dio.get('$base_url/medical-report',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);

      medicalReportsResponse = MedicalHistoryModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }
}
