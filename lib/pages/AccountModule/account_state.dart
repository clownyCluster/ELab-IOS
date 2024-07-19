import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elab/main.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';


import 'package:image_picker/image_picker.dart';

import '../../ApiModel/profile_model.dart';
import '../../constant/constant.dart';

class AccountState extends ChangeNotifier {
  AccountState() {
    getAccount();
  }
  // List gender = ['Male', 'Female', 'others'];
  // onGenderChanged(val) {
  //   gender = val;
  //   notifyListeners();
  // }

  List genderList = [
    {'index': 1, 'name': 'Male'},
    {'index': 2, 'name': 'Female'},
    {'index': 3, 'name': 'Others'}
  ];
  int selectedGenderIndex = 0;
  onSelectedGenderIndex(val) {
    selectedGenderIndex = val;
    notifyListeners();
    print(selectedGenderIndex);
  }

  String? name;
  String? phone;
  String? selectGender;
  String? dob;
  String? homeAddress;
  String? workingAddress;

  onNameChanged(val) {
    name = val;
    notifyListeners();
  }

  onPhoneChanged(val) {
    phone = val;
    notifyListeners();
  }

  onSelectGenderChanged(val) {
    selectGender = val;
    notifyListeners();
  }

  onDobChanged(val) {
    dob = val;
    notifyListeners();
  }

  onHomeAddressChanged(val) {
    homeAddress = val;
    notifyListeners();
  }

  onWorkingAddressChanged(val) {
    workingAddress = val;
    notifyListeners();
  }

  bool isLoading = false;
  setLoading(val) {
    isLoading = val;
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

  TextEditingController nameController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController workingAddressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alternativeNumberController = TextEditingController();

  var token = LocalStorageService().read(LocalStorageKeys.accessToken);
  Dio dio = Dio();
  patchAccount() async {
    var accountData = {
      'name': nameController.text,
      'contact': phoneController.text,
      'gender': selectedGenderIndex.toString(),
      'dob': dobController.text,
      'home_address': homeAddressController.text,
      'work_address': workingAddressController.text,
      'optional_contact': alternativeNumberController.text,
    };
    print(accountData);
    EasyLoading.show();
    try {
      var response = await dio.patch('$base_url/update-address',
          data: accountData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token'
          }));
      ToastService().s(response.data['message']);
      navigatorKey.currentState!.pop();
      print(response.data);
    } on DioException catch (e) {
      // ToastService().e(e.response!.data['message']);
      // ToastService().e('yo error ho');

      print(e.response);
    }
    EasyLoading.dismiss();
  }

  ProfileModel? profileResponse;
  getAccount() async {
    setLoading(true);

    try {
      var response = await dio.get('$base_url/customer_details/',
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $token',
          }));
      profileResponse = ProfileModel.fromJson(response.data);
      nameController.text = profileResponse!.data!.name ?? '';
      phoneController.text = profileResponse!.data!.contact ?? '';
      dobController.text = profileResponse!.data!.dob ?? '';
      homeAddressController.text = profileResponse!.data!.homeAddress ?? '';
      workingAddressController.text = profileResponse!.data!.workAddress ?? '';
      genderController.text = profileResponse!.data!.gender ?? '';

      print(response.data);
    } on DioException catch (e) {
      print(e.response);
    }
    setLoading(false);
  }

  File? galleryImage;
  var bytes;
  var fileName;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 25,
      );
      if (image == null) return null;
      galleryImage = File(image.path);
      final path = image.path;
      fileName = image.path.split('/').last;
      print('yo fileName ho $fileName');
      await cropImage();
      // Now, you have the cropped image in the galleryImage variable.
      notifyListeners();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> cropImage() async {
    if (galleryImage != null) {
      try {
        CroppedFile? cropped = await ImageCropper().cropImage(
            sourcePath: galleryImage!.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              // CropAspectRatioPreset.ratio3x2,
              // CropAspectRatioPreset.original,
              // CropAspectRatioPreset.ratio4x3,
              // CropAspectRatioPreset.ratio16x9,
            ],
            aspectRatio: CropAspectRatio(ratioX: 700, ratioY: 700));

        

        if (cropped != null) {
          galleryImage = File(cropped.path);
          notifyListeners();
        }
      } catch (e) {
        print('Error cropping image: $e');
      }
    }
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

  Future<void> uploadProfile() async {
    if (galleryImage == null || fileName == null) {
      print('No cropped image available.');
      return;
    }

    EasyLoading.show();

    final formData = FormData.fromMap({
      'profile_pic':
          await MultipartFile.fromFile(galleryImage!.path, filename: fileName),
    });

    var accessToken = LocalStorageService().read(LocalStorageKeys.accessToken);

    try {
      var response = await dio.post('$base_url/upload-profile-pic',
          data: formData,
          options: Options(headers: {
            'apikey': 'elab-ktmrush-api-v1-2023',
            'Authorization': 'Bearer $accessToken'
          }));

      print(response.data);
      ToastService().s(response.data['message']);
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        ToastService().e(e.response!.data['message']);
      } else {
        print('Network error: $e');
      }
    }

    EasyLoading.dismiss();
  }
}
