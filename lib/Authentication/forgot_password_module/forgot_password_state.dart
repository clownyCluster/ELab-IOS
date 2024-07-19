import 'package:dio/dio.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/main.dart';
import 'package:flutter/material.dart';

import '../Otp_Module/otp_screen.dart';

class ForgotPasswordState extends ChangeNotifier {
  bool submitLoading = false;
  setSubmitLoading(val) {
    submitLoading = val;
    notifyListeners();
  }

  Dio dio = Dio();
  String? email;
  onEmailChange(val) {
    email = val;
    notifyListeners();
  }

  onForgotPassword() async {
    var data = {
      'email': email,
    };
    print(data);
    setSubmitLoading(true);
    try {
      var response = await dio.post('$base_url/forgot-password',
          data: data,
          options: Options(headers: {'apikey': 'elab-ktmrush-api-v1-2023'}));
      print(response.data);
      navigatorKey.currentState!.pushNamed(OtpScreen.id);
    } on DioException catch (e) {
      print(e.response);
      print('yo error ho');
    }
    setSubmitLoading(false);
  }
}
