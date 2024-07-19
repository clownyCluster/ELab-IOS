import 'package:dio/dio.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';

import '../../ApiModel/cart_list_model.dart';

import '../../ApiModel/profile_model.dart';
import '../../constant/constant.dart';

class CheckoutState extends ChangeNotifier {
  CheckoutState() {
    getDetails();
  }

  showDatePickerFunction(context) async {
    var now = DateTime.now();
    DateTime? nextYear = DateTime(now.year + 1, now.month, now.day);

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: nextYear,
    );

    if (selectedDate != null) {
      // Do something with the selected date, if needed
      dateController.text = selectedDate.year.toString() +
          '-' +
          selectedDate.month.toString().padLeft(2, '0') +
          '-' +
          selectedDate.day.toString().padLeft(2, '0');
      print("Selected date: $selectedDate");
      notifyListeners();
    }
    notifyListeners();
  }

  showTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      String formattedTime = selectedTime.hour.toString().padLeft(2, '0') +
          ':' +
          selectedTime.minute.toString().padLeft(2, '0');
      timeController.text = formattedTime;
      notifyListeners();
      print(selectedTime);
    }
  }

  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool isCheckboxCart = false;
  onCheckboxCart(val) {
    isCheckboxCart = val;
    notifyListeners();
  }

  String? bookTime;
  String? bookDate;
  onBookDateChanged(val) {
    bookDate = val;
    notifyListeners();
    print(val);
  }

  onBookTimeChanged(val) {
    bookTime = val;
    notifyListeners();
    print(val);
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
}
