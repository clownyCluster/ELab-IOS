import 'package:dio/dio.dart';
import 'package:elab/main.dart';
import 'package:elab/pages/PaymentModule/payment_screen.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';

import '../CheckoutModule/checkout_screen.dart';

class BookForOtherState extends ChangeNotifier {
  CheckoutState() {}
  bool isCheckboxCart = false;
  onCheckboxCart(val) {
    isCheckboxCart = val;
    notifyListeners();
  }

  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  Dio dio = Dio();
  var accessToken = LocalStorageService().read(LocalStorageKeys.accessToken);

  List gender = ['Male', 'Female', 'others'];
  String? selectedGender;
  onGenderChanged(val) {
    selectedGender = val;
    notifyListeners();
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

  showDobPicker(context) async {
    var now = DateTime.now();
    DateTime? lastYear = DateTime(now.year - 150, now.month, now.day);

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: lastYear,
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      // Do something with the selected date, if needed
      dobController.text = selectedDate.year.toString() +
          '-' +
          selectedDate.month.toString().padLeft(2, '0') +
          '-' +
          selectedDate.day.toString().padLeft(2, '0');
      print("Selected date: $selectedDate");
      notifyListeners();
    }
    notifyListeners();
  }

  showTime(context) async {
    TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (selectedTime != null) {
      String formattedTime = selectedTime.hour.toString().padLeft(2, '0') +
          ':' +
          selectedTime.minute.toString().padLeft(2, '0');
      timeController.text = formattedTime;
      notifyListeners();
      print(selectedTime);
    }
    notifyListeners();
  }

  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String? name;
  String? contact;
  String? email;
  String? dob;
  String? address;
  // String? couponCode = 'TEST15';
  String? bookedDate;
  String? bookedTime;
  // String? paymentMethod = 'Cash on Delivery';

  onNameChanged(val) {
    name = val;
    notifyListeners();
  }

  onEmailChanged(val) {
    email = val;
    notifyListeners();
  }

  oncontactChanged(val) {
    contact = val;
    notifyListeners();
  }

  onDobChanged(val) {
    dob = val;
    notifyListeners();
  }

  onAddressChanged(val) {
    address = val;
    notifyListeners();
  }

  onBookDateChanged(val) {
    bookedDate = val;
    notifyListeners();
  }

  onBookTimeChanged(val) {
    bookedTime = val;
    notifyListeners();
    print(val);
  }

//   postOrder() async {
//     try {
//       setLoading(true);
//       var data = {
//         'name': name,
//         'contact': contact,
//         'email': email,
//         'dob': dob,
//         'address': address,
//         'gender': selectedGender,
//         'coupon_code ': couponCode,
//         'booked_date': bookedDate,
//         'booked_time': bookedTime,
//         'payment_method': paymentMethod,
//       };

//       print(data);
//       var response = await dio.post(
//           '$base_url/order-for-other',
//           data: data,
//           options: Options(headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//             'Authorization': 'Bearer $accessToken'
//           }));
//       print(response.data);
//       ToastService().s(response.data['message']);

//       // navigatorKey.currentState!.pushNamed(PaymentScreen.id);
//     } on DioException catch (e) {
//       print(e.response);
//     }
//     setLoading(false);
//   }
// }

// class PostData extends ChangeNotifier {
//   String? name;
//   String? contact;
//   String? email;
//   String? dob;
//   String? address;
//   String? couponCode = 'TEST15';
//   String? bookedDate;
//   String? bookedTime;
//   String? paymentMethod = 'Cash on Delivery';

//   List gender = ['Male', 'Female', 'others'];
//   String? selectedGender;
//   onGenderChanged(val) {
//     selectedGender = val;
//     notifyListeners();
//   }

//   onNameChanged(val) {
//     name = val;
//     notifyListeners();
//   }

//   onEmailChanged(val) {
//     email = val;
//     notifyListeners();
//   }

//   oncontactChanged(val) {
//     contact = val;
//     notifyListeners();
//   }

//   onDobChanged(val) {
//     dob = val;
//     notifyListeners();
//   }

//   onAddressChanged(val) {
//     address = val;
//     notifyListeners();
//   }

//   onBookDateChanged(val) {
//     bookedDate = val;
//     notifyListeners();
//   }

//   onBookTimeChanged(val) {
//     bookedTime = val;
//     notifyListeners();
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'contact': contact,
//       'email': email,
//       'dob': dob,
//       'address': address,
//       'gender': selectedGender,
//       'coupon_code ': couponCode,
//       'booked_date': bookedDate,
//       'booked_time': bookedTime,
//       'payment_method': paymentMethod,
//     };
//   }
}
