// import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elab/ApiModel/lifestyle_model.dart';
import 'package:elab/ApiModel/search_teast_model.dart';
import 'package:elab/ApiModel/test_model.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../../ApiModel/filter_package_model.dart';
import '../../ApiModel/package_conditions_model.dart';
import '../../ApiModel/specialized_model.dart';
import '../../constant/constant.dart';
import '../../service/toast_service.dart';

class IndividuleTestState extends ChangeNotifier {
  IndividuleTestState() {
    getTest(true);
    checkInternetConnection();
  }
  ConditionsModel? conditionsModelResponse;
  SpecializedModel? specializedResponse;
  TestModel? testModelResponse;
  LifestyleModel? lifestyleResponse;
  FilteTestModel? filterResponse;
  SearchTestModel? searchTestResponse;
  bool isLoading = false;
  Dio dio = Dio();
  List<int> checkedIds = [];
  List<int> checkedSpecializedIds = [];
  List<int> checkedLifestyleIds = [];

  int selected = 1;
  // bool checkBox = false;

  onCheckBoxSelected(id, newValue) {
    if (newValue == true) {
      checkedIds.add(id);
    } else {
      checkedIds.remove(id);
    }
    notifyListeners();
  }

  onClear() {
    searchController.clear();
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  bool sCheckBox = false;

  bool lowToHigh = true;
  onLowToHigh() {
    EasyLoading.show();
    lowToHigh = false;
    getTest(false);
    highToLow = true;
    notifyListeners();
  }

  bool highToLow = true;
  onHighTolow() {
    EasyLoading.show();

    highToLow = false;
    getTest(false);
    lowToHigh = true;
    notifyListeners();
  }

  String? searchList;
  onSearch(val) {
    searchList = val;
    // getSearch(val);
    notifyListeners();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }
  // Future getSearch(val) async {
  //   EasyLoading.show();
  //   try {
  //     print('yo try vitra xa hai');
  //     var response = await dio.get(
  //       '$base_url/search-tests?q=$val',
  //       options: Options(
  //         headers: {
  //           'apikey': 'elab-ktmrush-api-v1-2023',
  //         },
  //       ),
  //     );
  //     searchTestResponse = SearchTestModel.fromJson(response.data);

  //     print(response.data);
  //   } on DioException catch (e) {
  //     print(e.response);
  //   }
  //   EasyLoading.dismiss();
  // }

  // onSearch(String newValue) async {
  //   // searchController.text = name;

  //   // EasyLoading.show();
  //   for (var i = 0; i < testModelResponse!.data!.length; i++) {
  //     var name = testModelResponse!.data![i].name!.toString();

  //     if (name
  //         .toLowerCase()
  //         .contains(searchController.text.toString().toLowerCase())) {
  //       searchList.add(name);
  //       notifyListeners();
  //     } else {
  //       searchList.remove(name);
  //       notifyListeners();
  //     }
  //   }

  //   notifyListeners();
  //   print('yo search ko list ho ${searchList.toString()}');
  //   // EasyLoading.dismiss();
  // }
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  onSpecializedBoxSelected(id, newValue) {
    if (newValue == true) {
      checkedSpecializedIds.add(id);
    } else {
      checkedSpecializedIds.remove(id);
    }
    notifyListeners();
  }

  bool lCheckBox = false;
  TextEditingController searchController = TextEditingController();

  onLifestyleBoxSelected(id, newValue) {
    if (newValue == true) {
      checkedLifestyleIds.add(id);
    } else {
      checkedLifestyleIds.remove(id);
    }
    notifyListeners();
  }

  onSelectedChanged(val) {
    selected = val;
    notifyListeners();
  }

  List<String> packageList = [];
  List<int> packagePrice = [];
  List<int> highToLowPrice = [];

  getTest(bool loading) async {
    isLoading = loading;
    notifyListeners();

    try {
      print('yo try vitra xa hai');
      var response = await dio.get(
        '$base_url/tests',
        options: Options(
          headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          },
        ),
      );
      await getPackage();
      await getSpecialized();
      await getLifestyle();

      print(response.data);
      testModelResponse = TestModel.fromJson(response.data);
      if (testModelResponse?.data != null) {
        packageList =
            testModelResponse!.data!.map((e) => e.name.toString()).toList();
        packageList.sort();
        EasyLoading.dismiss();
      }
      if (testModelResponse?.data != null) {
        packagePrice = testModelResponse!.data!
            .map((e) => e.discountedPrice!.toInt())
            .toList();
        packagePrice.sort(
          (a, b) => b.compareTo(a),
        );
        EasyLoading.dismiss();
      }
      if (testModelResponse?.data != null) {
        highToLowPrice = testModelResponse!.data!
            .map((e) => e.discountedPrice!.toInt())
            .toList();
        highToLowPrice.sort(
          (a, b) => a.compareTo(b),
        );
        EasyLoading.dismiss();
      }
    } on DioException catch (e) {
      print(e.response);
    }
    isLoading = false;

    notifyListeners();
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

  String? package = 'test';

  postCart(testName) async {
    var cartData = {
      "package": package,
    };
    EasyLoading.show();
    try {
      var response = await dio.post('$base_url/add_to_cart/$testName',
          data: cartData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      ToastService().s(response.data['message']);
      print(cartData);
      print(response.data['message']);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
