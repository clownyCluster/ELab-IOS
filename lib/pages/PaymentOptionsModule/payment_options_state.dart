import 'package:dio/dio.dart';
import 'package:elab/pages/PaymentModule/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ApiModel/cart_list_model.dart';
import '../../ApiModel/profile_model.dart';
import '../../constant/constant.dart';
import '../../service/local_storage_service.dart';
import '../../service/toast_service.dart';

class PaymentOptionsState extends ChangeNotifier {
  PaymentOptionsState(context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    if (args['name'] != null) {
      name = args['name'];
    }
    if (args['contact'] != null) {
      contact = args['contact'];
    }
    if (args['email'] != null) {
      email = args['email'];
    }
    if (args['dob'] != null) {
      dob = args['dob'];
    }
    if (args['address'] != null) {
      address = args['address'];
    }
    if (args['booked_date'] != null) {
      bookedDate = args['booked_date'];
    }
    if (args['booked_time'] != null) {
      bookedTime = args['booked_time'];
    }
    if (args['gender'] != null) {
      selectGender = args['gender'];
    }

    notifyListeners();
    getDetails();
    checkInternetConnection();
    print(name);
    print(contact);
    print(address);
    print(bookedTime);
    print(bookedDate);
    print(email);
    print(dob);
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  String? selectGender;
  String? name;
  String? contact;
  String? email;
  String? dob;
  String? address;
  String? bookedDate;
  String? bookedTime;

  // String? discountCode;
  // onDiscountCodeChanged(val) {
  //   discountCode = val;
  //   notifyListeners();
  //   print(val);
  // }

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

  getDetails() async {
    try {
      setLoading(true);
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

  String? couponCode;
  String? paymentMethod;

  onCouponCode(val) {
    couponCode = val;
    notifyListeners();
  }

  postOrder(context) async {
    setLoading(true);

    var data = {
      'name': name,
      'contact': contact,
      'email': email,
      'dob': dob,
      'address': address,
      'gender': selectGender,
      'coupon_code ': couponCode,
      'booked_date': bookedDate,
      'booked_time': bookedTime,
      'payment_method': Payment,
    };
    print(data);

    try {
      var response = await dio.post('$base_url/order-for-other',
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
      ToastService().e('  ');
      print(e.response);
    }
    setLoading(false);
  }

  postDiscount() async {
    EasyLoading.show();
    var data = {'coupon_code': couponCode};
    print(data);
    try {
      var response = await dio.post('$base_url/coupon',
          data: data,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);

      ToastService().s(response.data['message']);
      await getCart();
    } on DioException catch (e) {
      ToastService().e(e.response!.data!['message']);
      print(e.response);
    }
    EasyLoading.dismiss();
  }
}
