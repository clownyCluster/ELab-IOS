import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ApiModel/report_model.dart';
import '../../constant/constant.dart';

class ReportState extends ChangeNotifier {
  ReportState() {
    getReport();
    checkInternetConnection();
  }
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  ReportModel? reportResponse;
  Dio dio = Dio();
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  getReport() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/reports',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token',
          }));
      reportResponse = ReportModel.fromJson(response.data);
      // for (var i = 0; i < reportResponse!.data!.length; i++) {
      //   reportUrl = reportResponse!.data![i].report;
      // }

      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  postReport(id) async {
    var data = {'order_id': id};
    print('post ko id ho  $id');
    // setLoading(true);
    try {
      var response = await dio.post('$base_url/report-status',
          data: data,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token',
          }));
    
    
    } on DioException catch (e) {
      print('yo muji post garda ko  error ho');
      print(e.response);
    }
    // setLoading(false);
  }

  

  Future<void> reportDownload(reportUrl) async {
    if (await canLaunch(reportUrl)) {
      await launch(reportUrl);
    } else {
      ToastService().e('message');
    }
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }
}
