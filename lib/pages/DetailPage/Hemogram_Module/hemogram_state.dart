import 'package:dio/dio.dart';
import 'package:elab/ApiModel/hemogram_model.dart';
import 'package:elab/pages/CheckoutModule/checkout_screen.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../constant/constant.dart';
import '../../../main.dart';
import '../../../screen/HomeModule/home_display.dart';

class HemogramState extends ChangeNotifier {
  HemogramState(context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map;
    if (args['slug'] != null) {
      slug = args['slug'];
    }
    if (args['title'] != null) {
      name = args['title'];
    }
    print(slug);
    // if(token == null)
    getTest();
  }
  String? slug;
  String? name;

  Dio dio = Dio();
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  TestModel? hemogramTestModelResponse;
  getTest() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/test/$slug',
          options: Options(headers: {'apikey': 'elab-ktmrush-api-v1-2023'}));
      hemogramTestModelResponse = TestModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  String? package = 'test';

  postCart(testName) async {
    var cartData = {
      "package": package,
    };

    try {
      EasyLoading.show();
      var response = await dio.post('$base_url/add_to_cart/$testName',
          data: cartData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      ToastService().s(response.data['message']);
      navigatorKey.currentState!.pushNamed(HomeDisplay.id, arguments: 'cart');
      print(cartData);
      print(response.data['message']);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }

  postPackage(testName) async {
    var cartData = {
      "package": package,
    };

    try {
      EasyLoading.show();
      var response = await dio.post('$base_url/add_to_cart/$testName',
          data: cartData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      ToastService().s(response.data['message']);
      navigatorKey.currentState!.pushNamed(CheckoutScreen.id);
      print(cartData);
      print(response.data['message']);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
