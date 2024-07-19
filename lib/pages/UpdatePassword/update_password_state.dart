import 'package:dio/dio.dart';
import 'package:elab/ApiModel/kidney_model.dart';
import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/main.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../service/toast_service.dart';

class UpdatePasswordState extends ChangeNotifier {
  UpdatePasswordState() {}
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

  String? oldPassword;
  String? password;
  String? confirmPassword;

  onOldPasswordChange(val) {
    oldPassword = val;
    notifyListeners();
  }

  onPasswordChange(val) {
    password = val;
    notifyListeners();
  }

  onConfirmPassword(val) {
    confirmPassword = val;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  onChangePassword() async {
    EasyLoading.show();
    try {
      var passwordData = {
        'old_password': oldPassword,
        'password': password,
        'confirm_password': confirmPassword,
      };
      var response = await dio.post(
          'https://beta.elabnepal.com/api/v1/change-password',
          data: passwordData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      ToastService().s(response.data['message']);

      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
      LocalStorageService().clear(LocalStorageKeys.accessToken);

      print(response);
    } on DioException catch (e) {
      ToastService().e(e.response!.data['message']);
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
