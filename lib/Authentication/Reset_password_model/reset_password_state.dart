import 'package:dio/dio.dart';
import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/main.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordState extends ChangeNotifier {
  ResetPasswordState() {}
  bool isPasswordVisible = true;
  onVisibilityChanged() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Dio dio = Dio();
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  var userId = LocalStorageService().read(LocalStorageKeys.userId);

  String? password;
  String? confirmPassword;

  onPasswordChange(val) {
    password = val;
    notifyListeners();
  }

  onConfirmPassword(val) {
    confirmPassword = val;
    notifyListeners();
  }

  postResetPassword() async {
    setLoading(true);
    try {
      var data = {
        'password': password,
        'confirm_password': confirmPassword,
        'user_id': userId,
      };
      print(data);
      var response = await dio.post('$base_url/reset-password',
          data: data,
          options: Options(headers: {'apikey': 'elab-ktmrush-api-v1-2023'}));
      navigatorKey.currentState!.pushNamed(LoginScreen.id);
      print(data);
      print(response.data);
      ToastService().s(response.data['message']);
    } on DioException catch (e) {
      print(e.response);
      ToastService().e(e.response!.data['message']);
    }
    setLoading(false);
  }
}
