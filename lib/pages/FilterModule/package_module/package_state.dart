import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../ApiModel/package_filter_model.dart';
import '../../../constant/constant.dart';
import '../../../service/local_storage_service.dart';
import '../../../service/toast_service.dart';

class PackageFilterState extends ChangeNotifier {
  PackageFilterState(context) {
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
    getFilter();
  }
  PackageFilterModel? packageFilterResponse;
  List<int> conditions = [];
  List<int> specializeds = [];
  List<int> lifestyleDisorders = [];

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
          '$base_url/filter-packages?conditions=$conditions&specializeds=$specializeds&lifestyle_disorders= $lifestyleDisorders',
          options: Options(
            headers: {
              'apikey': 'elab-ktmrush-api-v1-2023',
            },
          ));
      packageFilterResponse = PackageFilterModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
      print('yo error ho');
    }
    onLoading(false);
  }

  String? package = 'package';

  postCart(testName) async {
    var cartData = {
      "package": package,
    };
    print(testName);
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
    //  ToastService().s(e.response!.data['message']);
      print(e.response);
      
    }
    EasyLoading.dismiss();
  }
}
