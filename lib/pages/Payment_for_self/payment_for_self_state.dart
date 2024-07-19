import 'package:dio/dio.dart';
import 'package:elab/ApiModel/cart_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ApiModel/profile_model.dart';
import '../../constant/constant.dart';
import '../../service/local_storage_service.dart';
import '../../service/toast_service.dart';
import '../PaymentModule/payment_screen.dart';

class PaymentForMySelfState extends ChangeNotifier {
  PaymentForMySelfState(context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map;
    if (args['book_time'] != null) {
      bookedTime = args['book_time'];
    }
    if (args['book_date'] != null) {
      bookedDate = args['book_date'];
    }
    notifyListeners();
    getDetails(true);
    checkInternetConnection();
    print(bookedTime);
    print(bookedDate);
  }

  String? bookedDate;
  String? bookedTime;

  String? discountCode;
  onDiscountCodeChanged(val) {
    discountCode = val;
    notifyListeners();
    print(val);
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }
  // List <String> isCheckBox= [];
  // bool isCash = false;
  // onCashCheckboxChange(val) {
  //   isCash = val;
  //   notifyListeners();
  // }

  String Payment = 'Cash On Delivery';
  onPaymentChange(val) {
    Payment = (val);
    notifyListeners();
    print(Payment);
  }

  bool isCart = false;
  onCartChange(val) {
    isCart = val;
    notifyListeners();
  }

  bool isEsewa = false;
  onEsewaChange(val) {
    isEsewa = val;
    notifyListeners();
  }

  bool isKhalti = false;
  onKhaltiChange(val) {
    isKhalti = val;
    notifyListeners();
  }

  bool isCartExpanded = false;
  onCartExpandedChanged() {
    isCartExpanded = !isCartExpanded;
    notifyListeners();
  }

  bool isCheckoutExpanded = false;
  onCheckoutExpandedChanged() {
    isCheckoutExpanded = !isCheckoutExpanded;
    notifyListeners();
  }

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  ProfileModel? profileResponse;
  CartListModel? cartListResponse;

  Dio dio = Dio();
  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  getDetails(bool isLoading) async {
    try {
      setLoading(isLoading);

      var response = await dio.get('$base_url/customer_details/',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      await getCart();
      profileResponse = ProfileModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  getCart() async {
    try {
      var response = await dio.get('$base_url/cart_list',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      cartListResponse = CartListModel.fromJson(response.data);
      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
  }

  // String? couponCode;
  String? paymentMethod;

  // onCouponCode(val) {
  //   couponCode = val;
  //   notifyListeners();
  //   print(val);
  // }

  TextEditingController couponeController = TextEditingController();

  postDiscount() async {
    EasyLoading.show();
    var data = {'coupon_code': couponeController.text.toString()};
    try {
      var response = await dio.post('$base_url/coupon',
          data: data,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));

      await getDetails(false);

      ToastService().s(response.data['message']);
    } on DioException catch (e) {
      ToastService().e(e.response!.data!['message']);
      print(e.response);
    }
    EasyLoading.dismiss();
  }

  postOrder(context) async {
    setLoading(true);

    var data = {
      // 'coupon_code ': discountCode,
      'booked_date': bookedDate,
      'booked_time': bookedTime,
      'payment_method': Payment,
    };
    print(data);

    try {
      var response = await dio.post('$base_url/order-for-self',
          data: data,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);
      Navigator.pushNamed(
        context,
        PaymentScreen.id,
      );
      ToastService().s(response.data['message']);
    } on DioException catch (e) {
      print('error aayo');
      ToastService().e(e.response!.data['message']);
      print(e.response);
    }
    setLoading(false);
  }
}
