// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:elab/Authentication/login_module/login_screen.dart';
// import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/main.dart';
import 'package:elab/screen/HomeModule/home_display.dart';
// import 'package:elab/screen/HomeScreenModule/home_screen.dart';
import 'package:elab/screen/onBoadingModule/on_boarding_screen.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
// import 'package:get/utils.dart';

import '../../ApiModel/home_collection_model.dart';
import '../../constant/constant.dart';
import '../../pages/NoInternet/no_internet_screen.dart';
import '../LogoutScreenModule/new_home_screen.dart';

class SplashState extends ChangeNotifier {
  SplashState() {
    var token = LocalStorageService().read(LocalStorageKeys.accessToken);
    bool? isFirstTime =
        LocalStorageService().readBool(LocalStorageKeys.isFirstTime);
    if (isFirstTime == null) {
      Future.delayed(Duration(seconds: 2), () {
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(OnBoardingScreen.id, (route) => false);
      });
    } else {
      if (token != null) {
        Future.delayed(Duration(seconds: 2), () {
          navigatorKey.currentState!
              .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
        });
      } else {
        Future.delayed(Duration(seconds: 2), () {
          navigatorKey.currentState!
              .pushNamedAndRemoveUntil(LoginScreen.id, (route) => false);
        });
      }
    }
  }

  HomeCollection? homeCollectionResponse;
  Dio dio = Dio();
  getTest() async {
    try {
      var response = await dio.get('$base_url/book-a-home-collection',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      homeCollectionResponse = HomeCollection.fromJson(response.data);
      // print(response.data);
    } on DioException catch (e) {
      print('No Internet');
    }
  }
}
