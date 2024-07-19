import 'package:dio/dio.dart';
import 'package:elab/ApiModel/kidney_model.dart';
import 'package:elab/main.dart';
import 'package:elab/screen/HomeModule/home_display.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oktoast/oktoast.dart';

class RequestCallBackState extends ChangeNotifier {
  RequestCallBackState() {
    checkInternetConnection();
  }
  Dio dio = Dio();
  String? fullName;
  String? phoneNumber;
  String? email;
  String? callBack;
  String? comment;

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

  onFullNameChanged(val) {
    fullName = val;
    notifyListeners();
  }

  onPhoneNumberChange(val) {
    phoneNumber = val;
    notifyListeners();
  }

  onEmailChanged(val) {
    email = val;
    notifyListeners();
  }

  onCallbackChanged(val) {
    callBack = val;
    notifyListeners();
  }

  onCommentChanged(val) {
    comment = val;
    notifyListeners();
  }

  onCallPost() async {
    var requestData = {
      'name': fullName,
      'contact': phoneNumber,
      'email': email,
      'subject': callBack,
      'message': comment,
    };
    EasyLoading.show();
    try {
      var response =
          await dio.post('https://beta.elabnepal.com/api/v1/request-a-callback',
              data: requestData,
              options: Options(headers: {
                'apikey': 'elab-ktmrush-api-v1-2023',
              }));
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
      ToastService().s(response.data['message']);

      print(response);
    } on DioException catch (e) {
      ToastService().e(e.response!.data['message']);
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
