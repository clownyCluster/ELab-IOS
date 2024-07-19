import 'package:dio/dio.dart';
import 'package:elab/ApiModel/cart_list_model.dart';
import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/global.dart';
import 'package:elab/main.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../constant/constant.dart';

class CartState extends ChangeNotifier {
  CartState() {
    var token = LocalStorageService().read(LocalStorageKeys.accessToken);
    if (token != null) {
      getCart(true);
    }
  }

  Dio dio = Dio();
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  CartListModel? cartListResponse;
  CartListModel? cartResponse;
  bool isLoading = false;

  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  bool isCheckBox = false;

  List<int> quantity = [];

  onCountAdd(int val, String slug) {
    quantity[val]++;
    notifyListeners();
    patchCart(quantity[val], slug);
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  onCountSub(int val, String slug) {
    if (quantity[val] > 1) {
      quantity[val]--;
      notifyListeners();
    }
    patchCart(quantity[val], slug);
  }

  patchCart(int val, String slug) async {
    var data = {
      'quantity': val.toString(),
    };
    EasyLoading.show();
    try {
      var response = await dio.patch(
        '$base_url/update_cart/$slug',
        data: data,
        options: Options(headers: {
          'apikey': 'elab-ktmrush-api-v1-2023',
          'Authorization': 'Bearer $token'
        }),
      );
      ToastService().s(response.data!['message']);
      await getCart(false);

      print('yo data ho $data');

      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }

  getCart(bool isLoading) async {
    try {
      if (isLoading == true) {
        setLoading(true);
        print(isLoading);
      }
      var response = await dio.get('$base_url/cart_list',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      cartListResponse = CartListModel.fromJson(response.data);
      quantity = cartListResponse!.data!
          .map((item) => int.parse(item.quantity.toString()))
          .toList();
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  deleteCart(deletList) async {
    EasyLoading.show();

    try {
      var response = await dio.delete('$base_url/remove_cart/$deletList',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));

      await getCart(false);
      ToastService().s(response.data['message']);
      

      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }

  clearCart() async {
    EasyLoading.show();

    try {
      var response = await dio.delete('$base_url/clear_cart',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);
      await getCart(false);
      ToastService().s(response.data['message']);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
