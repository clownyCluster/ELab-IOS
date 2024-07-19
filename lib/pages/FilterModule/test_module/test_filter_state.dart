import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../ApiModel/filter_package_model.dart';
import '../../../constant/constant.dart';
import '../../../service/toast_service.dart';

class TestFilterState extends ChangeNotifier {
  TestFilterState(context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    if (args['conditions'] != null) {
      conditions = args['conditions'] ?? [];
    }
    if (args['specializeds'] != null) {
      specializeds = args['specializeds'] ?? [];
    }
    if (args['lifestyle_disorders'] != null) {
      lifestyleDisorders = args['lifestyle_disorders'] ?? [];
    }
    print(conditions);
    print(specializeds);
    print(lifestyleDisorders);
    checkInternetConnection();
    getFilter();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  List<int> conditions = [];
  List<int> specializeds = [];
  List<int> lifestyleDisorders = [];

  FilteTestModel? filterResponse;
  Dio dio = Dio();

  bool isLoading = false;
  onLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  getFilter() async {
    onLoading(true);
    try {
      print('yo try ho');
      var response = await dio.get(
          '$base_url/filter-tests?conditions=$conditions&specializeds=$specializeds&lifestyle_disorders= $lifestyleDisorders',
          options: Options(
            headers: {
              'apikey': 'elab-ktmrush-api-v1-2023',
            },
          ));
      filterResponse = FilteTestModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print('yo error ho');
    }
    onLoading(false);
  }

  String? package = 'test';

  postCart(testName) async {
    var cartData = {
      "package": 'test'
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
      // navigatorKey.currentState!.pushNamed(CheckoutScreen.id);
      print(cartData);
      print(response.data['message']);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
