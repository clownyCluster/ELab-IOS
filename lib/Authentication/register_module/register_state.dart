import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';

// import '../../constant/constant.dart';
import '../../constant/constant.dart';
import '../../main.dart';
import '../../service/toast_service.dart';
import '../Otp_Module/otp_screen.dart';

class RegisterState extends ChangeNotifier {
  Dio dio = Dio();
  String? name;
  String? email;
  String? password;
  String? address;
  String? number;
  String? confirmPassword;

  bool isPasswordVisible = false;
  onVisibilityChanged() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  onNameChanged(val) {
    name = val;
    notifyListeners();
  }

  onEmailChanged(val) {
    email = val;
    notifyListeners();
  }

  onPasswordChanged(val) {
    password = val;
    notifyListeners();
    // print(password);
  }

  onConfirmPasswordChanged(val) {
    confirmPassword = val;
    notifyListeners();
  }

  onNumberChanged(val) {
    number = val;
    notifyListeners();
  }

  bool isLoading = false;

  onRegister() async {
    isLoading = true;
    notifyListeners();
    var registerData = {
      "name": name,
      "email": email,
      "confirm_password": confirmPassword,
      "phone": number,
      "password": password,
    };
    print(registerData);
    try {
      var response = await dio.post("$base_url/register",
          data: registerData,
          options: Options(
            headers: {
              "apikey": "elab-ktmrush-api-v1-2023",
              "Accept": "application/json"
            },
          ));

      ToastService().s(response.data['message']);
      print(response.data['_token']);
      LocalStorageService()
          .write(LocalStorageKeys.registerToken, response.data['_token']);
      navigatorKey.currentState
          ?.pushNamed(OtpScreen.id, arguments: response.data['email']);
    } on DioException catch (err) {
      ToastService()
          .e(err.response!.data['message'], duration: Duration(seconds: 5));

      print("yo register ko error ho ");
      print(err.response);
    }
    isLoading = false;
    notifyListeners();
  }
}
