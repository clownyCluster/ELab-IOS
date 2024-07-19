import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';

import '../../../ApiModel/package_conditions_model.dart';
import '../../../ApiModel/single_package_model.dart';
import '../../../constant/constant.dart';
import '../../../service/toast_service.dart';

class PackageState extends ChangeNotifier {
  PackageState(context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map;
    if (args['slug'] != null) {
      slug = args['slug'];
    }
    if (args['title'] != null) {
      title = args['title'];
    }
    getConditions();
  }
  String? slug;
  String? title;
  Dio dio = Dio();
  bool isLoading = false;

  ConditionsModel? conditionsModelResponse;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  bool showMore = false;
  onShowmore() {
    showMore = !showMore;
    notifyListeners();
    print(showMore);
  }

  getConditions() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/conditions',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      conditionsModelResponse = ConditionsModel.fromJson(response.data);
      // print(response.data);
      await getPackage();
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  SinglePackageModel? packageModelResponse;
  List<int> indexList = [];
  getPackage() async {
    try {
      var response = await dio.get('$base_url/package/$slug',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      packageModelResponse = SinglePackageModel.fromJson(response.data);
      // selectedValue = packageModelResponse!.data!.testsAndParameters;

      notifyListeners();
      print('yo slug ho $slug');
    } on DioException catch (e) {
      print(e.response);
    }
  }

  bool isExpanded = false;
  int? selectedExpandedIndex;
  onExpandedChange(int index) {
    if (isExpanded) {
      selectedExpandedIndex = null;
    } else {
      selectedExpandedIndex = index;
    }
    isExpanded = !isExpanded;
    notifyListeners();
  }

  dynamic selectedValue;

  String? package = 'package';

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  postCart() async {
    var cartData = {
      "package": package,
    };

    try {
      setLoading(true);
      var response = await dio.post('$base_url/add_to_cart/$slug',
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
    setLoading(false);
  }
}
