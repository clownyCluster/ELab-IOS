import 'package:dio/dio.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ApiModel/extra_info.dart';
import '../../ApiModel/profile_model.dart';

class NewHomeState extends ChangeNotifier {
  NewHomeState() {
    getProfile(true);
  }
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  Dio dio = Dio();
  ExtraInfo? extraResponse;
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

  openInstagram(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openEmail(url) async {
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  onRefresh() async {
    // await saveData;

    notifyListeners();
  }

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

  ProfileModel? profileResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  // var profile;
  var saveData;
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
      saveData = profileResponse!.data;
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
}
