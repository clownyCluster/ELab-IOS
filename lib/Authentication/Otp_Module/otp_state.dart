import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/cupertino.dart';

import '../../constant/constant.dart';
import '../../main.dart';
import '../../service/toast_service.dart';
import '../Reset_password_model/reset_password_screen.dart';
import '../login_module/login_screen.dart';

class OtpState extends ChangeNotifier {
  String? email;
  OtpState(context) {
    // final args = ModalRoute.of(context)?.settings.arguments as String;
    // if (args != null) {
    //   email = args;
    //   notifyListeners();
    //   print(email);
    // }
  }
  bool isButtonClicked = false;
  String? verificationCode;
  get accessToken => null;
  submitLoading(val) {
    isButtonClicked = val;
    notifyListeners();
  }

  // 4 text editing controllers that associate with the 4 input fields
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();

  verifyOTP(String code) async {
    var token = LocalStorageService().read(LocalStorageKeys.registerToken);

    submitLoading(true);
    Dio dio = Dio();
    var data = {
      'otp': code,
    };
    print('yo code ho $code');
    print(data);
    try {
      var response = await dio.post('$base_url/check-otp',
          data: data,
          options: Options(
            headers: {
              "apikey": "elab-ktmrush-api-v1-2023",
              "Authorization": "Bearer $token"
            },
          ));
      // print(response.data);
      // ToastService().s(
      //     'Email verified Successfully.\n Please login to get into the app.',
      //     duration: Duration(seconds: 4));
      print('yo user id ho ${response.data['data']}');
      LocalStorageService()
          .write(LocalStorageKeys.userId, response.data['data']);
      navigatorKey.currentState!.pushNamed(ResetPasswordScreen.id);
      // print('yo success ho');
    } on DioError catch (e) {
      print(e.response);
      print(' yo OtpState ko error ho');

      // ToastService().e(e.response!.data!['message']);
    }
    submitLoading(false);
  }

  resentOtp() async {
    Dio dio = Dio();
    var token = accessToken.read("token");
    var data = {"email": email};
    try {
      var response = await dio.post("$base_url/resend",
          data: data,
          options: Options(headers: {
            "apikey": "elab-ktmrush-api-v1-2023",
            "Authorization": "Bearer $token"
          }));
      ToastService().s(response.data['message']);
      print(response.data);
    } on DioError catch (err) {
      print('yo error ho');
      print(err.response);
    }
  }
}
