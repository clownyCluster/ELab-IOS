import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
// import 'package:elab/service/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ApiModel/home_collection_model.dart';
import '../../ApiModel/kidney_model.dart';
import '../../ApiModel/test_model.dart';
import '../../constant/constant.dart';
import '../../main.dart';
import '../../screen/HomeModule/home_display.dart';
import '../../service/toast_service.dart';

class HomeCollectionState extends ChangeNotifier {
  HomeCollectionState() {
    checkInternetConnection();
    getPackage();
  }
  Dio dio = Dio();
  PackageModel? packageResponse;
  TestModel? testResponse;

  HomeCollection? homeCollectionResponse;
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  int selectedViewIndex = 0;
  onTestSelected() {
    selectedViewIndex = 1;
    notifyListeners();
  }
  onPackagSelected() {
    selectedViewIndex = 0;
    notifyListeners();
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);

  getPackage() async {
    try {
      setLoading(true);
      var response = await dio.get('$base_url/packages',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      packageResponse = PackageModel.fromJson(response.data);
      await getTest();
      print(response.data);
    } on DioException catch (e) {
      print(e.response!.data);
    }
    setLoading(false);
  }

  getTest() async {
    try {
      var response = await dio.get('$base_url/book-a-home-collection',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
          }));
      homeCollectionResponse = HomeCollection.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response!.data);
    }
  }

  postCart(testName, String package) async {
    var cartData = {
      "package": package,
    };
    print(testName);
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
}
