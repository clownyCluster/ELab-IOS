// import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elab/main.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

import '../../constant/constant.dart';
import '../../service/local_storage_service.dart';

class UploadePrescriptionState extends ChangeNotifier {
  bool isCheckBox = false;
  onCheckBoxChanged() {
    isCheckBox = !isCheckBox;
    notifyListeners();
  }

  bool isLoading = false;
  setLoading(val) {
    isLoading = !val;
    notifyListeners();
    print(isLoading);
  }

  List gender = ['Male', 'Female', 'Others'];
  onGenderChanged(val) {
    gender = val;
    notifyListeners();
    print(val);
  }

  List genderList = [
    {'index': 1, 'name': 'Male'},
    {'index': 2, 'name': 'Female'},
    {'index': 3, 'name': 'Others'}
  ];

  int selectedGenderIndex = 1;

  onSelectedGenderIndex(val) {
    selectedGenderIndex = val;
    notifyListeners();
    print(selectedGenderIndex);
  }

  String? name;
  String? email;
  String? number;
  String? dob;
  String? prescription;
  String? address;

  onNameChange(val) {
    name = val;
    print(name);

    notifyListeners();
  }

  onEmailChange(val) {
    email = val;
    print(email);

    notifyListeners();
  }

  onNumberChange(val) {
    number = val;
    print(number);

    notifyListeners();
  }

  onDobChange(val) {
    dob = val;
    notifyListeners();
    print(dob);
  }

  // onSelectedGenderChange(val) {
  //   selectedGenderIndex = val;
  //   notifyListeners();
  //   print(selectedGenderIndex);
  // }

  onAddressChange(val) {
    address = val;
    notifyListeners();
    print(address);
  }

  Dio dio = Dio();

  File? galleryImage;
  var bytes;
  var fileName;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );
      if (image == null) return null;
      galleryImage = File(image.path);
      final path = image.path;
      fileName = (image.path.split('/').last);
      print('yo fileName ho $fileName');
      print('yo bytes ho $bytes');
      bytes = File(path).readAsBytesSync();
      notifyListeners();
      // getLostData();
      // cropImage();
      // uploadPrescription();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // getLostData() async {
  //   final ImagePicker picker = ImagePicker();
  //   final LostDataResponse response = await picker.retrieveLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   final List<XFile>? files = response.files;
  //   if (files != null) {
  //     pickImage(files as ImageSource);
  //   } else {
  //     pickImage(response.exception as ImageSource);
  //   }
  // }

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

  TextEditingController dobController = TextEditingController();

  uploadPrescription() async {
    EasyLoading.show();
    // setLoading(true);
    // Dio dio = Dio();
    final formData = FormData.fromMap({
      'name': name,
      'contact': number,
      'email': email,
      'gender': selectedGenderIndex.toString(),
      'dob': dobController.text,
      'address': address,
      'prescription': await MultipartFile.fromBytes(bytes, filename: fileName),
    });
    var accessToken = LocalStorageService().read(LocalStorageKeys.accessToken);
    print(formData.toString());
    try {
      var response = await dio.post('$base_url/upload-prescription',
          data: formData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $accessToken'
          }));
      print(response.data);
      print(formData);
      ToastService().s(response.data['message']);
      navigatorKey.currentState!.pop();
    } on DioException catch (e) {
      print(e.response);
      ToastService().e(e.response!.data['message']);

      EasyLoading.dismiss();
    }

    EasyLoading.dismiss();
  }

  displayBottomSheet(context) async {
    return await showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      context: context,
      builder: (context) => Container(
        padding: kStandardPadding(),
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Image From :',
              style: kkBoldTextStyle(),
            ),
            ListTile(
              // contentPadding: EdgeInsets.all(0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
              dense: true,
              minVerticalPadding: 0,
              leading: Icon(
                Icons.camera,
                size: 17,
                color: Colors.black,
              ),
              title: Text(
                'Camera',
                style: kkTextStyle(),
              ),
              onTap: () {
                pickImage(ImageSource.camera);
                navigatorKey.currentState!.pop();
              },
            ),
            ListTile(
              // contentPadding: EdgeInsets.all(0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              dense: true,
              minVerticalPadding: 0,
              leading: Icon(
                Icons.image,
                size: 17,
                color: Colors.black,
              ),
              title: Text(
                'Gallery',
                style: kkTextStyle(),
              ),
              onTap: () {
                pickImage(ImageSource.gallery);
                navigatorKey.currentState!.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}




























// Future<void> uploadPrescription(File file) async {
  //   try {
  //     setLoading(true);
  //     var data = {
  // 'name': name,
  // 'contact': number,
  // 'email': email,
  // 'gender': selectedGenderIndex.toString(),
  // 'dob': dob,
  // 'address': address,
  //       // 'prescription':prescriptionImage,
  //     };
  //     print(data);

  //     var response = await dio.post(
  //       '$base_url/upload-prescription',
  //       data:data,
  //       options: Options(
  //         headers: {
  //           'apikey': 'elab-ktmrush-api-v1-2023',
  //           'Authorization': 'Bearer $token'
  //         },
  //       ),
  //     );

  //     print(response.data);
  //   } on DioException catch (e) {
  //     // ToastService().e(e.response!.data['message']);
  //     print('${e.response!.data}');
  //   } finally {
  //     setLoading(false);
  //   }
  // }

  //