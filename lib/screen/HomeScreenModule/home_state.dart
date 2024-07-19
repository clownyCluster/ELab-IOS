// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:elab/ApiModel/extra_info.dart';
// import 'package:elab/ApiModel/search_model.dart';
// import 'package:elab/ApiModel/test_model.dart';
// import 'package:elab/Drawer_Pages/Drawer_Model/drawer_screen.dart';
// import 'package:elab/constant/constant.dart';
// import 'package:elab/screen/Loading_Module/loading.dart';
// import 'package:elab/service/local_storage_service.dart';
// import 'package:elab/service/toast_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../ApiModel/kidney_model.dart';
// import '../../ApiModel/report_model.dart';
// import '../../ApiModel/slider_model.dart';
// import '../../pages/NoInternet/no_interner_state.dart';

// class HomeState extends ChangeNotifier {
//   HomeState(context) {
//     // checkInternetConnection();
//     getKidneyPackage(context);
//     onCountChange();
//   }
//   Timer? timer;
//   int count = 0;
//   onCountChange() {
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (isLoading == true) {
//         count++;
//         notifyListeners();
//         print(count);
//       }
//     });
//   }

//   bool isLoading = false;

//   TestModel? testModelResponse;
//   PackageModel? kidneyPackageResponse;
//   SliderModel? sliderModelResponse;
//   ExtraInfo? extraResponse;
//   ReportModel? reportResponse;
//   SearchModel? searchResponse;

//   Dio dio = Dio();
//   var token = LocalStorageService().read(LocalStorageKeys.accessToken);
//   String? phoneNumber = '9851358000';
//   openWhatsApp() async {
//     String url = 'https://wa.me/$phoneNumber';

//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       ToastService().e('message');
//     }
//   }

//   List<String> data = [];

//   makePhoneCall() async {
//     final phoneNumber = '9851358000';
//     final url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print('can not lunch $url');
//     }
//   }

//   openMap(String? url) async {
//     if (await canLaunch(url!)) {
//       await launch(url);
//     } else {
//       print('Can not lunch url');
//     }
//   }

//   bool isNetConnected = true;
//   checkInternetConnection() async {
//     final isConnected = await InternetConnectionChecker().hasConnection;
//     notifyListeners();
//     isNetConnected = isConnected;
//     notifyListeners();
//   }

//   onSearch(String newValue) async {
//     notifyListeners();
//   }

//   // openInstagram(url) async {
//   //   final instagram = url;

//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }

//   TextEditingController searchController = TextEditingController();

//   openFacebook() async {
//     const facebookURL =
//         'https://www.facebook.com/profile.php?id=100094295302002';
//     if (await canLaunch(facebookURL)) {
//       await launch(facebookURL);
//     } else {
//       throw 'Could not launch $facebookURL';
//     }
//   }

//   openTikTok() async {
//     String tiktokUrl = 'https://www.tiktok.com/@elabnepalpvtltd';
//     if (await canLaunch(tiktokUrl)) {
//       await launch(tiktokUrl);
//     } else {
//       throw 'Could not launch $tiktokUrl';
//     }
//   }

//   String? package = 'package';

//   postCart(slug, type) async {
//     var cartData = {
//       "package": type,
//     };
//     EasyLoading.show();
//     try {
//       var response = await dio.post('$base_url/add_to_cart/$slug',
//           data: cartData,
//           options: Options(headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//             'Authorization': 'Bearer $token'
//           }));
//       ToastService().s(response.data['message']);
//       print(slug);
//       print(cartData);
//     } on DioException catch (e) {
//       print(e.response);
//     }
//     EasyLoading.dismiss();
//   }

//   List<String?>? packageListData = [];
//   getKidneyPackage(context) async {
//     isLoading = true;
//     notifyListeners();
//     try {
//       var response = await dio.get(
//         '$base_url/packages',
//         options: Options(
//           headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//           },
//         ),
//       );
//       kidneyPackageResponse = PackageModel.fromJson(response.data);

//       if (kidneyPackageResponse?.data != null) {
//         packageListData =
//             kidneyPackageResponse?.data?.map((e) => e.name).toList();
//         packageListData!.sort();
//       }
//       print(
//           'yo package ko count ho ${kidneyPackageResponse!.data![0].parametersCount.toString()}');

//       await getTest();
//       await getSearch();
//       await checkIsFirstTime(context);
//       if (token != null) {
//         await getReport();
//       }
//     } on DioException catch (e) {
//       print(e.response);
//     }
//     isLoading = false;
//     notifyListeners();
//   }

//   getReport() async {
//     try {
//       var response = await dio.get('$base_url/reports',
//           options: Options(headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//             'Authorization': 'Bearer $token',
//           }));
//       reportResponse = ReportModel.fromJson(response.data!);

//       for (var i = 0; i < reportResponse!.data!.length; i++) {
//         reportUrl = reportResponse!.data![i].report;
//       }

//       print(response.data);
//     } on DioException catch (e) {
//       print(e.response);
//     }
//   }

//   var reportUrl;

//   Future<void> reportDownload() async {
//     if (await canLaunch(reportUrl)) {
//       await launch(reportUrl);
//     } else {
//       ToastService().e('message');
//     }
//   }

//   getSearch() async {
//     try {
//       var response = await dio.get(
//           '$base_url/search-test?q=${searchController.text.toString().toLowerCase()}',
//           options: Options(headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//             'Authorization': 'Bearer $token'
//           }));
//       searchResponse = SearchModel.fromJson(response.data);

//       print(response.data);
//     } on DioException catch (e) {
//       print(e.response);
//     }
//   }

//   // getSlider() async {
//   //   try {
//   //     var response = await dio.get('$base_url/sliders',
//   //         options: Options(headers: {
//   //           'apikey': 'elab-ktmrush-api-v1-2023',
//   //         }));
//   //     sliderModelResponse = SliderModel.fromJson(response.data);
//   //     await getExtraInfo();
//   //     print(response.data);
//   //   } on DioException catch (e) {
//   //     print(e.response);
//   //   }
//   // }

//   onClean() {
//     searchController.clear();
//     notifyListeners();
//   }

//   getExtraInfo() async {
//     try {
//       var response = await dio.get('$base_url/site-details',
//           options: Options(headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//           }));
//       extraResponse = ExtraInfo.fromJson(response.data);
//       print(response.data);
//     } on DioException catch (e) {
//       print(e.response);
//     }
//   }

//   List? testListData = [];
//   getTest() async {
//     try {
//       print('yo try vitra xa hai');
//       var response = await dio.get(
//         '$base_url/tests',
//         options: Options(
//           headers: {
//             'apikey': 'elab-ktmrush-api-v1-2023',
//           },
//         ),
//       );
//       print('yo get test ho hai');
//       testModelResponse = TestModel.fromJson(response.data);

//       if (testModelResponse?.data != null) {
//         testListData = testModelResponse!.data!.map((e) => e.name).toList();
//         testListData?.sort(); // Sort the names alphabetically
//       }
//     } on DioException catch (e) {
//       print(e.response);
//     }
//   }

//   TutorialCoachMark? tutorialCoachMarkResponse;
//   List<TargetFocus> target = [];
//   GlobalKey searchKey = GlobalKey();
//   GlobalKey menuKey = GlobalKey();
//   GlobalKey locationKey = GlobalKey();

//   setTarget(context) async {
//     target = [
//       TargetFocus(
//         identify: 'search',
//         keyTarget: searchKey,
//         contents: [
//           TargetContent(
//             builder: (context, controller) {
//               return TutorialGuide(
//                 onNext: () {
//                   controller.next();
//                   notifyListeners();
//                 },
//                 onSkip: () {
//                   controller.skip();
//                   notifyListeners();
//                 },
//                 text:
//                     'You can search for whatever is required here with the help of this app',
//                 next: 'Next',
//                 skip: 'Skip',
//               );
//             },
//           ),
//         ],
//       ),
//       TargetFocus(
//         color: Colors.black,
//         identify: 'Menu key',
//         keyTarget: menuKey,
//         contents: [
//           TargetContent(
//             builder: (context, controller) {
//               return TutorialGuide(
//                 onNext: () {
//                   controller.next();
//                   notifyListeners();
//                 },
//                 onSkip: () {
//                   controller.skip();
//                   notifyListeners();
//                 },
//                 text:
//                     'This is menu bar gives you easy control to more features',
//                 next: 'Next',
//                 skip: 'Skip',
//               );
//             },
//           ),
//         ],
//       ),
//       TargetFocus(
//         color: Colors.black,
//         identify: 'Location Key',
//         keyTarget: locationKey,
//         contents: [
//           TargetContent(
//             builder: (context, controller) {
//               return TutorialGuide(
//                 onNext: () {
//                   controller.next();
//                   notifyListeners();
//                 },
//                 onSkip: () {
//                   controller.skip();
//                   notifyListeners();
//                 },
//                 text:
//                     'This is your location. You can change the location of your place and set a new location as per your preference.',
//                 skip: 'Skip',
//                 next: 'Finish',
//               );
//             },
//           ),
//         ],
//       ),
//     ];
//     Future.delayed(const Duration(milliseconds: 100), () {
//       showTutorial(context);
//     });
//   }

//   showTutorial(context) {
//     tutorialCoachMarkResponse = TutorialCoachMark(
//       targets: target,
//       colorShadow: Color.fromARGB(255, 0, 0, 0),
//       opacityShadow: 0.97,
//       hideSkip: true,
//     )..show(context: context);
//   }

//   checkIsFirstTime(context) {
//     bool? isFirstTime =
//         LocalStorageService().readBool(LocalStorageKeys.isFirstTime);

//     print(' is firsttime : $isFirstTime');
//     if (isFirstTime == null) {
//       Future.delayed(
//         const Duration(seconds: 2),
//         () {
//           setTarget(context);
//         },
//       );
//     }
//     LocalStorageService().write(LocalStorageKeys.isFirstTime, false);
//     // notifyListeners();
//   }
// }

// // Future<bool> isFirstLaunch() async {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

// //       if (isFirstLaunch) {
// //         // If it's the first launch, set the flag to false
// //         await prefs.setBool('firstLaunch', false);
// //       }

// //       return isFirstLaunch;
// //     }

// //     bool isFirstTime = await isFirstLaunch();

// //     if (isFirstTime) {
// //       // Perform first-time launch tasks
// //       // Example: Show an onboarding screen, tutorial, etc.
// //     } else {
// //       // App has been opened before
// //     }

// class TutorialGuide extends StatelessWidget {
//   String? text;
//   String? skip;
//   String? next;
//   final void Function()? onSkip;
//   final void Function()? onNext;
//   TutorialGuide({this.next, this.onNext, this.onSkip, this.skip, this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         // height: MediaQuery.of(context).size.height * 2 / 4,
//         padding: kStandardPadding(),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           // color: Colors.black,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               text!,
//               style: kkWhiteBoldTextStyle(),
//             ),
//             kSizedBox(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   onTap: onSkip,
//                   child: Container(
//                     height: 40,
//                     width: 80,
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: primaryColor,
//                     ),
//                     child: Center(
//                       child: Text(
//                         skip!,
//                         style: kWhiteBoldTextStyle(),
//                       ),
//                     ),
//                   ),
//                 ),
//                 maxWidthSpan(),
//                 InkWell(
//                   onTap: onNext,
//                   child: Container(
//                     height: 40,
//                     width: 80,
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: primaryColor,
//                     ),
//                     child: Center(
//                       child: Text(
//                         next!,
//                         style: kWhiteBoldTextStyle(),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
