import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ApiModel/kidney_model.dart';
import '../../ApiModel/lifestyle_model.dart';
import '../../ApiModel/package_conditions_model.dart';
import '../../ApiModel/specialized_model.dart';
import '../../constant/constant.dart';
import '../../main.dart';
import '../../screen/HomeModule/home_display.dart';
import '../../service/toast_service.dart';
import '../CheckoutModule/checkout_screen.dart';

class HealthPackagesState extends ChangeNotifier {
  HealthPackagesState() {
    getKidneyPackage(true);
    checkInternetConnection();
  }

  ConditionsModel? conditionsModelResponse;
  SpecializedModel? specializedResponse;
  LifestyleModel? lifestyleResponse;
  List<int> checkedIds = [];
  List<int> checkedSpecializedIds = [];
  List<int> checkedLifestyleIds = [];

  int selected = 1;
  // bool checkBox = false;
  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  TextEditingController searchController = TextEditingController();

  onSearch(String newValue) async {
    notifyListeners();
  }

  onCheckBoxSelected(id, newValue) {
    if (newValue == true) {
      checkedIds.add(id);
    } else {
      checkedIds.remove(id);
    }
    notifyListeners();
  }

  bool sCheckBox = false;

  onSpecializedBoxSelected(id, newValue) {
    if (newValue == true) {
      checkedSpecializedIds.add(id);
    } else {
      checkedSpecializedIds.remove(id);
    }
    notifyListeners();
  }

  bool lCheckBox = false;

  onLifestyleBoxSelected(id, newValue) {
    if (newValue == true) {
      checkedLifestyleIds.add(id);
    } else {
      checkedLifestyleIds.remove(id);
    }
    notifyListeners();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  onClear() {
    searchController.clear();
    notifyListeners();
  }

  bool lowToHigh = true;
  onLowToHigh() {
    // EasyLoading.show();
    lowToHigh = false;
    getKidneyPackage(false);
    highToLow = true;
    notifyListeners();
  }

  bool highToLow = true;
  onHighTolow() {
    // EasyLoading.show();
    highToLow = false;
    getKidneyPackage(false);
    lowToHigh = true;
    notifyListeners();
  }

  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  PackageModel? kidneyResponse;
  Dio dio = Dio();
  List packageList = [];
  List<int> packagePrice = [];
  List<int> highToLowPrice = [];
  getKidneyPackage(bool isLoading) async {
    try {
      setLoading(isLoading);
      var response = await dio.get('$base_url/packages',
          options: Options(headers: {'apikey': 'elab-ktmrush-api-v1-2023'}));
      kidneyResponse = PackageModel.fromJson(response.data);
      if (kidneyResponse?.data != null) {
        packageList = kidneyResponse!.data!.map((e) => e.name).toList();
        packageList.sort();
      }
      if (kidneyResponse?.data != null) {
        packagePrice = kidneyResponse!.data!
            .map((e) => e.discountedPrice!.toInt())
            .toList();
        packagePrice.sort(
          (a, b) => b.compareTo(a),
        );

        EasyLoading.dismiss();
      }
      if (kidneyResponse?.data != null) {
        highToLowPrice = kidneyResponse!.data!
            .map((e) => e.discountedPrice!.toInt())
            .toList();
        highToLowPrice.sort(
          (a, b) => a.compareTo(b),
        );

        EasyLoading.dismiss();
      }

      await getPackage();
      await getSpecialized();
      await getLifestyle();

      print(response);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  getPackage() async {
    try {
      var response = await dio.get('$base_url/conditions',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      conditionsModelResponse = ConditionsModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
  }

  getSpecialized() async {
    try {
      var response = await dio.get('$base_url/specialized',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      specializedResponse = SpecializedModel.fromJson(response.data);

      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
  }

  getLifestyle() async {
    try {
      var response = await dio.get('$base_url/lifestyle-disorders',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      lifestyleResponse = LifestyleModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
  }

  String? package = 'package';

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
      navigatorKey.currentState!.pushNamed(HomeDisplay.id, arguments: 'cart');
      print(testName);
      print(cartData);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
