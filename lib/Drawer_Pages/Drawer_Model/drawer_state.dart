import 'package:dio/dio.dart';
import 'package:elab/constant/utils.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ApiModel/extra_info.dart';
import '../../ApiModel/profile_model.dart';
import '../../constant/constant.dart';
import '../../service/toast_service.dart';

class DrawerState extends ChangeNotifier {
  DrawerState() {
    checkIsFirstTime();
    var token = LocalStorageService().read(LocalStorageKeys.accessToken);
    checkInternetConnection();
    if (token == null) {
      notifyListeners();
    } else {
      getProfile(true);
      getTimeOfDay();
    }
  }

  var time = TimeOfDay.now();

  String getTimeOfDay() {
    if (time.hour >= 0 && time.hour < 12) {
      return 'morning';
    } else if (time.hour >= 12 && time.hour < 18) {
      return 'afternoon';
    } else {
      return 'night';
    }
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  var googleToken = LocalStorageService().read(LocalStorageKeys.googleToken);
  bool? isFirstTime =
      LocalStorageService().readBool(LocalStorageKeys.isFirstTime);
  var name;
  openInstagram(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': '',
        'body': '',
      },
    );

    final String emailUrl = emailUri.toString();

    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'Could not launch email';
    }
  }

  ExtraInfo? extraResponse;

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  openFacebook(facebookUrl) async {
    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }

  openLikedInUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openTikTok(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchGoogleMaps(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openWhatsApp(phoneNumber) async {
    final url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }

  makePhoneCall() async {
    final phoneNumber = '9851358000';
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('can not lunch $url');
    }
  }

  Dio dio = Dio();
  ProfileModel? profileResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  // var profile;
  var saveData;

  checkIsFirstTime() {
    bool? isFirstTime =
        LocalStorageService().readBool(LocalStorageKeys.isFirstTime);

    print(' is firsttime : $isFirstTime');
    if (isFirstTime == null) {
      Future.delayed(
        const Duration(seconds: 2),
        () {},
      );
    }
    LocalStorageService().write(LocalStorageKeys.isFirstTime, false);
  }

  getProfile(bool isLoading) async {
    try {
      setLoading(isLoading);
      var response = await dio.get('$base_url/customer_details',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      profileResponse = ProfileModel.fromJson(response.data);
      // name = profileResponse!.data!.name!;
      // saveData = profileResponse!.data;
      await getExtraInfo();
      notifyListeners();
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print(e);
    }
    setLoading(false);
    EasyLoading.dismiss();
  }

  getExtraInfo() async {
    try {
      var response = await dio.get('$base_url/site-details',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      extraResponse = ExtraInfo.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
  }
}
