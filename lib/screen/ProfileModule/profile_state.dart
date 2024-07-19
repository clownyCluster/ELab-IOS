import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elab/ApiModel/orders_model.dart';
import 'package:elab/ApiModel/report_model.dart';
import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/main.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ApiModel/profile_model.dart';
import '../../constant/constant.dart';

class ProfileState extends ChangeNotifier {
  ProfileState() {
    var token = LocalStorageService().read(LocalStorageKeys.accessToken);
    if (token != null) {
      getProfile();
      checkInternetConnection();
    }
  }
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  var googleToken = LocalStorageService().read(LocalStorageKeys.googleToken);
  Dio dio = Dio();
  ProfileModel? profileResponse;
  OrderModel? orderModelResponse;
  ReportModel? reportModelResponse;
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

  getProfile() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/customer_details',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      profileResponse = ProfileModel.fromJson(response.data);
      await getOrders();
      await getReports();
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print(e);
    }
    setLoading(false);
  }

  // deleteAccount() async {
  //   var deleteAccount = {'user':  googleToken};
  //   try {
  //     setLoading(true);

  //     var response = await dio.delete('$base_url/account/delete',
  //         data: deleteAccount,
  //         options: Options(headers: {
  //           'apikey': 'elab-ktmrush-api-v1-2023',
  //           'Authorization': 'Bearer $token'
  //         }));
  //     navigatorKey.currentState!
  //         .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
  //     print(response);
  //     LocalStorageService().clear(LocalStorageKeys.accessToken);

  //   }  on DioException catch (e) {
  //     print(e.response!.data);

  //   }
  //   setLoading(false);
  // }

  deleteAccount() async {
    EasyLoading.show();
    var data = {};
    print(data);
    try {
      var response = await dio.delete(
        '$base_url/account/delete',
        data: data,
        options: Options(
          headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      if (response.data != null && response.data['message'] != null) {
        ToastService().s(response.data['message']);
      } else {
        ToastService().e("An unexpected error occurred.");
      }
      await LocalStorageService().clear(LocalStorageKeys.accessToken);
      await LocalStorageService().clear(LocalStorageKeys.registerToken);
      await LocalStorageService().clear(LocalStorageKeys.googleToken);
      navigatorKey.currentState!.pop();
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
    } on DioException catch (e) {
      ToastService().e('Failed to delete account!');
      // if (e.response != null &&
      //     e.response!.data != null &&
      //     e.response!.data['message'] != null) {
      //   ToastService().e(e.response!.data['message']);
      // } else {
      //   ToastService()
      //       .e("An error occurred while trying to delete the account.");
      // }
      print(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  getOrders() async {
    try {
      var response = await dio.get('$base_url/orders',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      orderModelResponse = OrderModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print(e);
    }
  }

  getReports() async {
    try {
      var response = await dio.get('$base_url/reports',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      reportModelResponse = ReportModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print(e);
    }
  }

  onDelecteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Account!'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    navigatorKey.currentState!.pop();
                  },
                  child: Container(
                    child: Text('Cancel'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigatorKey.currentState!.pop();
                    deleteAccount();
                  },
                  child: Container(
                    child: Text('ok'),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
