// import 'package:elab/Drawer_Pages/Drawer_Model/drawer_state.dart';
// import 'package:elab/constant/constant.dart';
// import 'package:elab/constant/k_button.dart';
// import 'package:elab/constant/ui_helpers.dart';
// import 'package:elab/pages/Covide_Module/covide.dart';
// import 'package:elab/pages/DetailPage/Hemogram_Module/hemogram_screen.dart';
// import 'package:elab/pages/HealthPackagesModule/health_packages_screen.dart';
// import 'package:elab/pages/Home_Collection_Module/home_collection_screen.dart';
// import 'package:elab/pages/NoInternet/no_internet_screen.dart';
// import 'package:elab/pages/TestsModule/individule_test_screen.dart';
// import 'package:elab/pages/DetailPage/PackageDetailsModule/package_screen.dart';
// import 'package:elab/pages/RequestCallback_Module/callback_screen.dart';
// import 'package:elab/pages/Upload_Prescription_Module/upload_screen.dart';
// import 'package:elab/screen/HomeScreenModule/home_state.dart';
// import 'package:elab/screen/Loading_Module/loading.dart';
// import 'package:elab/service/toast_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import '../../Drawer_Pages/Drawer_Model/drawer_screen.dart';

// class HomeScreen extends StatelessWidget {
//   static const String id = "HomeScreen";

//   @override
//   Widget build(BuildContext context) {
  
//     final state = Provider.of<HomeState>(context);
//     return state.isLoading == true
//         ? Loading()
//         : SafeArea(
//             child: Scaffold(
//               // backgroundColor: const Color.fromARGB(255, 238, 238, 238),
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 backgroundColor: Colors.grey[200],
//                 iconTheme: IconThemeData(color: Colors.grey),
//                 // title: Container(
//                 //     width: 115,
//                 //     child: Image.network(
//                 //       state.extraResponse!.data!.logo!,
//                 //       // height: 50,
//                 //       width: 115,
//                 //       loadingBuilder: (context, child, loadingProgress) {
//                 //         if (loadingProgress == null) {
//                 //           return child;
//                 //         } else {
//                 //           return Center(
//                 //             child: CircularProgressIndicator(
//                 //               color: primaryColor,
//                 //             ),
//                 //           );
//                 //         }
//                 //       },
//                 //       fit: BoxFit.cover,
//                 //     )),

//                 title: Container(
//                   width: double.infinity,
//                   height: 55,
//                   padding: EdgeInsets.symmetric(vertical: 5),
//                   // padding: kStandardPadding(),
//                   alignment: Alignment.center,
//                   color: const Color.fromARGB(255, 241, 241, 241),
//                   child: TextFormField(
//                     onChanged: state.onSearch,
//                     controller: state.searchController,
//                     decoration: InputDecoration(
//                         isDense: true,
//                         suffixIcon: InkWell(
//                             onTap: () {
//                               state.onClean();
//                             },
//                             child: state.searchController.text.isNotEmpty
//                                 ? Icon(Icons.clear)
//                                 : Text('')),
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: primaryColor,
//                           key: state.searchKey,
//                         ),
//                         hintText: "Search",
//                         fillColor: whiteColor,
//                         filled: true,
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color: primaryColor)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 201, 190, 190)),
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 ),
//                 // centerTitle: false,
//                 // bottom: PreferredSize(
//                 //   preferredSize: Size.fromHeight(40.0),
//                 //   child: Container(
//                 //     height: 55,
//                 //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 //     // padding: kStandardPadding(),
//                 //     alignment: Alignment.center,
//                 //     color: const Color.fromARGB(255, 241, 241, 241),
//                 //     child: TextFormField(
//                 //       decoration: InputDecoration(
//                 //           isDense: true,
//                 //           prefixIcon: Icon(
//                 //             Icons.search,
//                 //             color: primaryColor,
//                 //             key: state.searchKey,
//                 //           ),
//                 //           hintText: "Search",
//                 //           fillColor: whiteColor,
//                 //           filled: true,
//                 //           focusedBorder: OutlineInputBorder(
//                 //               borderRadius: BorderRadius.circular(10),
//                 //               borderSide: BorderSide(color: primaryColor)),
//                 //           enabledBorder: OutlineInputBorder(
//                 //               borderSide: BorderSide(
//                 //                   color: Color.fromARGB(255, 201, 190, 190)),
//                 //               borderRadius: BorderRadius.circular(10))),
//                 //     ),
//                 //   ),
//                 // ),
//                 elevation: 0,
//                 actions: [
//                   InkWell(
//                     child: Image.asset(
//                       'assets/images/location-icon.png',
//                       key: state.locationKey,
//                     ),
//                     onTap: () {
//                       ToastService().e('This Feature is currently unavailable');
//                     },
//                   ),
//                 ],
//                 leading: Builder(
//                   builder: (context) {
//                     return InkWell(
//                       child: Image.asset(
//                         'assets/images/menu.png',
//                         key: state.menuKey,
//                       ),
//                       onTap: () {
//                         Get.to(
//                             ChangeNotifierProvider(
//                               child: DrawerScreen(),
//                               create: (_) => DrawerState(),
//                             ),
//                             transition: Transition.leftToRight);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               body: state.isNetConnected == false
//                   ? ConnectivityScreen()
//                   : state.searchController.text.isNotEmpty
//                       ? SingleChildScrollView(
//                           child: Container(
//                             padding: kStandardPadding(),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: state.searchResponse!.data!.map((e) {
//                                   var name = e.name!;

//                                   if (name.toLowerCase().contains(state
//                                       .searchController.text
//                                       .toString()
//                                       .toLowerCase())) {
//                                     print(
//                                         'List of search ${name.length.toString()}');

//                                     return Container(
//                                       child: InkWell(
//                                         onTap: () {
//                                           if (e.type == 'test') {
//                                             Navigator.pushNamed(
//                                                 context, HemogramScreen.id,
//                                                 arguments: {
//                                                   'slug': e.slug,
//                                                   'name': e.name
//                                                 });
//                                           } else {
//                                             Navigator.pushNamed(
//                                                 context, PackageScreen.id,
//                                                 arguments: {
//                                                   'slug': e.slug,
//                                                   'title': e.name,
//                                                 });
//                                           }
//                                         },
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Container(
//                                                     height: 25,
//                                                     width: 25,
//                                                     child: Image.network(
//                                                         e.icon ??
//                                                             e.thumbnail!)),
//                                                 maxWidthSpan(),
//                                                 Expanded(
//                                                   child: Text(
//                                                     e.name!,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Divider(),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   }

//                                   return Container(
//                                     height: 0,
//                                     width: 0,
//                                   );
//                                 }).toList()),
//                           ),
//                         )
//                       : SingleChildScrollView(
//                           physics: BouncingScrollPhysics(),
//                           child: Container(
//                             // padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
//                             padding: kStandardPadding(),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.pushNamed(
//                                           context,
//                                           HealthPackagesScreen.id,
//                                         );
//                                       },
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.434,
//                                         height: 150,
//                                         padding: sPadding,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               width: 1,
//                                               color: Color.fromARGB(
//                                                   255, 204, 204, 204)),
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255),
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Container(
//                                               height: 110,
//                                               width: 130,
//                                               child: Image.asset(
//                                                   'assets/images/package.png'),
//                                             ),
//                                             Text(
//                                               'Packages',
//                                               style: kkBoldTextStyle(),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.pushNamed(
//                                             context, IndividuleTestScreen.id);
//                                       },
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.434,
//                                         height: 150,
//                                         padding: sPadding,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               width: 1,
//                                               color: Color.fromARGB(
//                                                   255, 204, 204, 204)),
//                                           color: Color.fromARGB(
//                                               255, 255, 255, 255),
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                         ),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                               height: 110,
//                                               width: 120,
//                                               child: Image.asset(
//                                                 'assets/images/test.png',
//                                                 fit: BoxFit.fill,
//                                               ),
//                                             ),
//                                             Text(
//                                               'Test',
//                                               style: kkBoldTextStyle(),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 // Container(
//                                 //   decoration: BoxDecoration(
//                                 //     borderRadius: BorderRadius.circular(10),
//                                 //   ),
//                                 //   width: double.infinity,
//                                 //   child: ImageSlideshow(
//                                 //     width: double.infinity,
//                                 //     height: 200,
//                                 //     initialPage: 0,
//                                 //     indicatorColor:
//                                 //         Color.fromARGB(255, 47, 61, 143),
//                                 //     indicatorBackgroundColor: Colors.grey,
//                                 //     onPageChanged: (value) {},
//                                 //     autoPlayInterval: 2000,
//                                 //     isLoop: true,
//                                 //     children: state.sliderModelResponse!.data!
//                                 //         .map((e) {
//                                 //       return Image.network(
//                                 //         e.image!,
//                                 //         height: 50,
//                                 //         width: 50,
//                                 //         loadingBuilder:
//                                 //             (context, child, loadingProgress) {
//                                 //           if (loadingProgress == null) {
//                                 //             return child;
//                                 //           } else {
//                                 //             return Center(
//                                 //               child: CircularProgressIndicator(
//                                 //                 color: primaryColor,
//                                 //               ),
//                                 //             );
//                                 //           }
//                                 //         },
//                                 //         fit: BoxFit.cover,
//                                 //       );
//                                 //     }).toList(),
//                                 //   ),
//                                 // ),

//                                 // ),
//                                 LSizedBox(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.pushNamed(
//                                             context, IndividuleTestScreen.id);
//                                       },
//                                       child: Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.43609,
//                                           //  width: MediaQuery.of(context).size.width * 0.43609,
//                                           height: 50,
//                                           padding: sPadding,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color: Color.fromARGB(
//                                                     255, 204, 204, 204)),
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             // boxShadow: [
//                                             //   BoxShadow(
//                                             //     color: const Color.fromARGB(
//                                             //         255, 196, 196, 196),
//                                             //     blurRadius:
//                                             //         2.0, // soften the shadow
//                                             //     spreadRadius:
//                                             //         1.3, //extend the shadow
//                                             //     offset: Offset(
//                                             //       2.0, // Move to right 5  horizontally
//                                             //       2.0, // Move to bottom 5 Vertically
//                                             //     ),
//                                             //   ),
//                                             // ],
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Image.asset(
//                                                   'assets/images/test_tube.png'),
//                                               minWidthSpan(),
//                                               Expanded(
//                                                   child: Text(
//                                                 "Book A Test",
//                                                 overflow: TextOverflow.ellipsis,
//                                               )),
//                                             ],
//                                           )),
//                                     ),
//                                     maxWidthSpan(),
//                                     InkWell(
//                                       onTap: () {
//                                         if (state.token == null) {
//                                           ToastService().e(
//                                               'You have to login to access this feature');
//                                         } else {
//                                           Navigator.pushNamed(context,
//                                               UploadePrescriptionScreen.id);
//                                         }
//                                       },
//                                       child: Container(
//                                           height: 50,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.43609,
//                                           padding: sPadding,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color: Color.fromARGB(
//                                                     255, 204, 204, 204)),
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             // boxShadow: [
//                                             //   BoxShadow(
//                                             //     color: const Color.fromARGB(
//                                             //         255, 196, 196, 196),
//                                             //     blurRadius:
//                                             //         2.0, // soften the shadow
//                                             //     spreadRadius:
//                                             //         1.3, //extend the shadow
//                                             //     offset: Offset(
//                                             //       2.0, // Move to right 5  horizontally
//                                             //       2.0, // Move to bottom 5 Vertically
//                                             //     ),
//                                             //   ),
//                                             // ],
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Image.asset(
//                                                   'assets/images/upload-cloud .png'),
//                                               minWidthSpan(),
//                                               Expanded(
//                                                 child: Text(
//                                                   "Upload Prescription",
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                 ),
//                                               ),
//                                             ],
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                                 kSizedBox(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         state.reportDownload();
//                                       },
//                                       child: Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.43609,
//                                           height: 50,
//                                           padding: sPadding,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 width: 1,
//                                                 color: Color.fromARGB(
//                                                     255, 204, 204, 204)),
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             // boxShadow: [
//                                             //   BoxShadow(
//                                             //     color: const Color.fromARGB(
//                                             //         255, 196, 196, 196),
//                                             //     blurRadius:
//                                             //         2.0, // soften the shadow
//                                             //     spreadRadius:
//                                             //         1.3, //extend the shadow
//                                             //     offset: Offset(
//                                             //       2.0, // Move to right 5  horizontally
//                                             //       2.0, // Move to bottom 5 Vertically
//                                             //     ),
//                                             //   ),
//                                             // ],
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Image.asset(
//                                                   'assets/images/download-report.png'),
//                                               minWidthSpan(),
//                                               Expanded(
//                                                 child: Text(
//                                                   "Download Reports",
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                 ),
//                                               ),
//                                             ],
//                                           )),
//                                     ),
//                                     maxWidthSpan(),
//                                     InkWell(
//                                       // onTap: () {
//                                       //   Navigator.pushNamed(context, HemogramScreen.id);
//                                       // },
//                                       onTap: () {
//                                         state.openMap(state
//                                             .extraResponse!.data!.googlemap!);
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.43609,
//                                         padding: sPadding,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               width: 1,
//                                               color: Color.fromARGB(
//                                                   255, 204, 204, 204)),
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           // boxShadow: [
//                                           //   BoxShadow(
//                                           //     color: const Color.fromARGB(
//                                           //         255, 196, 196, 196),
//                                           //     blurRadius:
//                                           //         2.0, // soften the shadow
//                                           //     spreadRadius:
//                                           //         1.3, //extend the shadow
//                                           //     offset: Offset(
//                                           //       2.0, // Move to right 5  horizontally
//                                           //       2.0, // Move to bottom 5 Vertically
//                                           //     ),
//                                           //   ),
//                                           // ],
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             Image.asset(
//                                                 'assets/images/location.png'),
//                                             minWidthSpan(),
//                                             Expanded(
//                                               child: Text(
//                                                 "Our Lab Location",
//                                                 overflow: TextOverflow.ellipsis,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 LSizedBox(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Specialized Health Packages",
//                                       style: kkBoldTextStyle()
//                                           .copyWith(color: primaryColor),
//                                     ),
//                                     InkWell(
//                                       child: Row(
//                                         children: [
//                                           Text("View All"),
//                                           minWidthSpan(),
//                                           Icon(
//                                             Icons.arrow_forward,
//                                             size: 12,
//                                           )
//                                         ],
//                                       ),
//                                       onTap: () {
//                                         Navigator.pushNamed(
//                                             context, HealthPackagesScreen.id);
//                                       },
//                                     )
//                                   ],
//                                 ),
//                                 LSizedBox(),

//                                 SingleChildScrollView(
//                                   physics: BouncingScrollPhysics(),
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                     children:
//                                         state.packageListData!.map((name) {
//                                       if (name == null) {
//                                         return Container();
//                                       }

//                                       final packageData = state
//                                           .kidneyPackageResponse!.data!
//                                           .firstWhere(
//                                         (data) => data.name == name,
//                                       );

//                                       return Row(
//                                         children: [
//                                           HealthTile(
//                                             state: state,
//                                             slug: packageData.slug,
//                                             image: packageData.icon,
//                                             title: packageData.name,
//                                             price: packageData.price,
//                                             discountedPrice:
//                                                 packageData.discountedPrice,
//                                             parameters:
//                                                 packageData.parametersCount,
//                                           ),
//                                           maxWidthSpan(),
//                                         ],
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),

//                                 kSizedBox(),

//                                 InkWell(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Individual Health Tests',
//                                         style: kkBoldTextStyle()
//                                             .copyWith(color: primaryColor),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Text('View All'),
//                                           minWidthSpan(),
//                                           Icon(
//                                             Icons.arrow_forward,
//                                             size: 12,
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   onTap: () {
//                                     Navigator.pushNamed(
//                                         context, IndividuleTestScreen.id);
//                                   },
//                                 ),
//                                 LSizedBox(),
//                                 SingleChildScrollView(
//                                   physics: BouncingScrollPhysics(),
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                       children: state.testListData!.map((name) {
//                                     if (name == null) {
//                                       return Container();
//                                     }
//                                     final testData = state
//                                         .testModelResponse!.data!
//                                         .firstWhere(
//                                       (data) => data.name == name,
//                                     );

//                                     return Row(
//                                       children: [
//                                         IndividualTiles(
//                                           state: state,
//                                           slug: testData.slug,
//                                           description: testData.shortContent,
//                                           discountedPrice:
//                                               testData.discountedPrice,
//                                           image: testData.thumbnail,
//                                           price: testData.price,
//                                           title: testData.name,
//                                         ),
//                                         maxWidthSpan(),
//                                       ],
//                                     );
//                                   }).toList()),
//                                 ),
//                                 LSizedBox(),
//                                 Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(context,
//                                                 HomeColloctionScreen.id);
//                                           },
//                                           child: HomeTile(
//                                             image: 'assets/images/home.png',
//                                             title: 'Book A Home Collection',
//                                             description:
//                                                 'Complete haemogram is a test that measures the number of RBCs, WBCs and platelets in blood it also ... ',
//                                           ),
//                                         ),
//                                         // SizedBox(
//                                         //     width: MediaQuery.of(context).size.width *
//                                         //         0.029),
//                                         maxWidthSpan(),
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(context,
//                                                 HomeColloctionScreen.id);
//                                           },
//                                           child: InkWell(
//                                             child: HomeTile(
//                                               image: 'assets/images/corona.png',
//                                               title: 'Book A Covid-19 Test',
//                                               description:
//                                                   'Complete haemogram is a test that measures the number of RBCs, WBCs and platelets in blood it also ... ',
//                                             ),
//                                             onTap: () {
//                                               Navigator.pushNamed(
//                                                   context, CovideScreen.id);
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     kSizedBox(),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             state.reportDownload();
//                                           },
//                                           child: HomeTile(
//                                             image: 'assets/images/download.png',
//                                             title: 'Download MyReports',
//                                             description:
//                                                 'Complete haemogram is a test that measures the number of RBCs, WBCs and platelets in blood it also ... ',
//                                           ),
//                                         ),
//                                         // SizedBox(
//                                         //     width: MediaQuery.of(context).size.width *
//                                         //         0.029),
//                                         maxWidthSpan(),
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(context,
//                                                 UploadePrescriptionScreen.id);
//                                           },
//                                           child: HomeTile(
//                                             image: 'assets/images/upload.png',
//                                             title: 'Upload A Prescription',
//                                             description:
//                                                 'Complete haemogram is a test that measures the number of RBCs, WBCs and platelets in blood it also ... ',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     kSizedBox(),
//                                     // state.token == null
//                                     //     ? SizedBox()
//                                     //     : Column(
//                                     //         children: [
//                                     //           Row(
//                                     //             mainAxisAlignment:
//                                     //                 MainAxisAlignment.spaceBetween,
//                                     //             children: [
//                                     //               Text(
//                                     //                 'Your Recent Test Results',
//                                     //                 style: kkBoldTextStyle()
//                                     //                     .copyWith(
//                                     //                         color: primaryColor),
//                                     //               ),
//                                     //               Row(
//                                     //                 children: [
//                                     //                   Text('View All'),
//                                     //                   minWidthSpan(),
//                                     //                   Icon(
//                                     //                     Icons.arrow_forward,
//                                     //                     size: 12,
//                                     //                   )
//                                     //                 ],
//                                     //               ),
//                                     //             ],
//                                     //           ),
//                                     //           LSizedBox(),
//                                     //           Container(
//                                     //             child: state.reportResponse!.data ==
//                                     //                         null ||
//                                     //                     state.reportResponse!
//                                     //                             .data ==
//                                     //                         [] ||
//                                     //                     state.reportResponse!.data!
//                                     //                         .isEmpty
//                                     //                 ? Center(
//                                     //                     child: Text('No Data !'))
//                                     //                 : Column(
//                                     //                     children: state
//                                     //                         .reportResponse!.data!
//                                     //                         .map((e) =>
//                                     //                             RecentTestTile(
//                                     //                               name: e.packageName![0],
//                                     //                             ))
//                                     //                         .toList(),
//                                     //                   ),
//                                     //           ),

//                                     kSizedBox(),
//                                     // Container(
//                                     //   // height: 40,
//                                     //   padding: kPadding(),
//                                     //   decoration: BoxDecoration(
//                                     //     borderRadius:
//                                     //         BorderRadius.circular(10),
//                                     //     color: Color.fromARGB(
//                                     //         255, 204, 204, 204),
//                                     //     boxShadow: [
//                                     //       BoxShadow(
//                                     //         color: Color.fromARGB(
//                                     //             255, 255, 255, 255),
//                                     //         blurRadius:
//                                     //             2.0, // soften the shadow
//                                     //         spreadRadius:
//                                     //             2.0, //extend the shadow
//                                     //         offset: Offset(
//                                     //           2.0, // Move to right 5  horizontally
//                                     //           2.0, // Move to bottom 5 Vertically
//                                     //         ),
//                                     //       )
//                                     //     ],
//                                     //   ),
//                                     //   child: Column(
//                                     //     children: [
//                                     //       Row(
//                                     //         mainAxisAlignment:
//                                     //             MainAxisAlignment
//                                     //                 .spaceBetween,
//                                     //         children: [
//                                     //           Row(
//                                     //             mainAxisAlignment:
//                                     //                 MainAxisAlignment
//                                     //                     .start,
//                                     //             children: [
//                                     //               Image.asset(
//                                     //                   'assets/images/microscope.png'),
//                                     //               maxWidthSpan(),
//                                     //               Text(
//                                     //                 'PCOS Advance \n Panel',
//                                     //                 style:
//                                     //                     kBoldTextStyle(),
//                                     //               ),
//                                     //             ],
//                                     //           ),
//                                     //           Image.asset(
//                                     //               'assets/images/arrow.png')
//                                     //         ],
//                                     //       ),
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     // RecentTestTile(),
//                                   ],
//                                   // ),
//                                   // ],
//                                 ),
//                                 LSizedBox(),
//                                 Divider(
//                                   height: 1,
//                                   color: Colors.grey,
//                                 ),
//                                 LSizedBox(),
//                                 Container(
//                                   padding: kPadding(),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.white,
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color:
//                                             Color.fromARGB(255, 204, 204, 204),

//                                         blurRadius: 2.0, // soften the shadow
//                                         spreadRadius: 1.3, //extend the shadow
//                                         offset: Offset(
//                                           2.0, // Move to right 5  horizontally
//                                           2.0, // Move to bottom 5 Vertically
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Center(
//                                           child: Image.asset(
//                                               'assets/images/call-girl.png')),
//                                       LSizedBox(),
//                                       Text(
//                                         'Request A Callback',
//                                         style: kkBoldTextStyle(),
//                                       ),
//                                       LSizedBox(),
//                                       Text(
//                                         'Have any queries or questions ? Send them our way and we will get back to you within 24 hrs.',
//                                         style: kBoldTextStyle(),
//                                       ),
//                                       LSizedBox(),
//                                       KButton(
//                                         child: Text(
//                                           'Request A Callback',
//                                           style: kWhiteBoldTextStyle(),
//                                         ),
//                                         onPressed: () {
//                                           if (state.token == null) {
//                                             ToastService().e(
//                                                 'You have to login to access this feature');
//                                           } else {
//                                             Navigator.pushNamed(context,
//                                                 RequestCallBackScreen.id);
//                                           }
//                                         },
//                                         backgroundColor: primaryColor,
//                                         radius: 10,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 kSizedBox()
//                               ],
//                             ),
//                           ),
//                         ),
//             ),
//           );
//   }
// }

// // class RecentTestTile extends StatelessWidget {
// //   String? name;
// //   String? id;
// //   RecentTestTile({
// //     this.id,
// //     this.name,
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       // height: 40,
// //       padding: kPadding(),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(10),
// //         color: Color.fromARGB(255, 204, 204, 204),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Color.fromARGB(255, 247, 246, 246),
// //             blurRadius: 15.0, // soften the shadow
// //             spreadRadius: 5.0, //extend the shadow
// //             offset: Offset(
// //               2.0, // Move to right 5  horizontally
// //               2.0, // Move to bottom 5 Vertically
// //             ),
// //           )
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   // Image.asset('assets/images/blood.png'),
// //                   maxWidthSpan(),
// //                   Text(
// //                     name!,
// //                     style: kBoldTextStyle(),
// //                   ),
// //                 ],
// //               ),
// //               Image.asset('assets/images/arrow.png')
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// class HomeTile extends StatelessWidget {
//   String? image;
//   String? title;
//   String? description;
//   // final void Function()? onPressed;

//   HomeTile({
//     // required this.onPressed,
//     this.description,
//     this.image,
//     this.title,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 220,
//       width: MediaQuery.of(context).size.width * 0.43609,
//       padding: kPadding(),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(width: 1, color: Color.fromARGB(255, 204, 204, 204)),
//         color: Colors.white,
//         // boxShadow: const [
//         //   BoxShadow(
//         //     color: const Color.fromARGB(255, 196, 196, 196),
//         //     blurRadius: 2.0, // soften the shadow
//         //     spreadRadius: 1.3, //extend the shadow
//         //     offset: Offset(
//         //       2.0, // Move to right 5  horizontally
//         //       2.0, // Move to bottom 5 Vertically
//         //     ),
//         //   )
//         // ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(image!),
//           kSizedBox(),
//           Text(
//             title!,
//             style: kkBoldTextStyle().copyWith(fontSize: 21),
//           ),
//           kSizedBox(),
//           Row(
//             children: [
//               Expanded(
//                   child: Text(
//                 description!,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 4,
//               )),
//             ],
//           ),
//           sSizedBox(),
//           // Container(
//           //   width: 150,
//           //   padding: kPadding(),
//           //   decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(10),
//           //       color: primaryColor,
//           //       border: Border.all(width: 1, color: primaryColor)),
//           //   child: Center(
//           //     child: Text(
//           //       'Book Now',
//           //       style: kWhiteBoldTextStyle(),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

// class IndividualTiles extends StatelessWidget {
//   String? title;
//   String? description;
//   String? price;
//   String? discountedPrice;
//   String? image;
//   final HomeState state;
//   String? slug;
//   IndividualTiles({
//     super.key,
//     this.slug,
//     required this.state,
//     this.description,
//     this.discountedPrice,
//     this.price,
//     this.title,
//     this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, HemogramScreen.id,
//                 arguments: {'slug': slug, 'name': title});
//           },
//           child: Container(
//             padding: sPadding,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   width: 1, color: Color.fromARGB(255, 204, 204, 204)),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               // boxShadow: [
//               //   BoxShadow(
//               //     color: const Color.fromARGB(255, 196, 196, 196),

//               //     blurRadius: 2.0, // soften the shadow
//               //     spreadRadius: 1.3, //extend the shadow
//               //     offset: Offset(
//               //       2.0, // Move to right 5  horizontally
//               //       2.0, // Move to bottom 5 Vertically
//               //     ),
//               //   )
//               // ],
//             ),
//             width: 160,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image.asset(
//                 //   'assets/images/service.png',
//                 //   width: 150,
//                 // ),
//                 Container(
//                     height: 100,
//                     width: 150,
//                     child: Image.network(
//                       image!,
//                       fit: BoxFit.cover,
//                     )),
//                 sSizedBox(),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         title!,
//                         style: kkBoldTextStyle().copyWith(fontSize: 14),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//                 sSizedBox(),
//                 Row(
//                   children: [
//                     Text(
//                       'Rs.$discountedPrice',
//                       style: kBoldTextStyle(),
//                     ),
//                     minWidthSpan(),
//                     Text('Rs.$price', style: kUnderline()),
//                   ],
//                 ),
//                 sSizedBox(),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         // 'Complete haemogram is a test that measures the number of RBCs, WBCs  and platelets in blood it also ... ',
//                         description!,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ),
//                   ],
//                 ),
//                 kSizedBox(),
//                 InkWell(
//                   onTap: () {
//                     if (state.token == null) {
//                       ToastService()
//                           .e('You have to login to access this feature');
//                     } else {
//                       state.postCart(slug, 'test');
//                     }
//                   },
//                   child: Container(
//                     width: 160,
//                     padding: kPadding(),
//                     decoration: BoxDecoration(
//                       // border: Border.all(width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                       color: primaryColor,
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Add To Cart",
//                         style: kWhiteBoldTextStyle(),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         kSizedBox(),
//       ],
//     );
//   }
// }

// class CheckUpTile extends StatelessWidget {
//   const CheckUpTile({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.36,
//             padding: kPadding(),
//             decoration: BoxDecoration(
//               border: Border.all(
//                   width: 1, color: Color.fromARGB(255, 204, 204, 204)),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               // boxShadow: [
//               //   BoxShadow(
//               //     color: const Color.fromARGB(255, 196, 196, 196),
//               //     blurRadius: 2.0, // soften the shadow
//               //     spreadRadius: 1.3, //extend the shadow
//               //     offset: Offset(
//               //       2.0, // Move to right 5  horizontally
//               //       2.0, // Move to bottom 5 Vertically
//               //     ),
//               //   )
//               // ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/liver.png'),
//                 kSizedBox(),
//                 Text(
//                   'Liver Function  \nProfile',
//                   style: kBoldTextStyle(),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Rs.5,500',
//                       style: kBoldTextStyle(),
//                     ),
//                     minWidthSpan(),
//                     Text('Rs.7,500', style: kUnderline()),
//                   ],
//                 ),
//                 kSizedBox(),
//                 Container(
//                   width: 160,
//                   padding: sPadding,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: primaryColor),
//                     borderRadius: BorderRadius.circular(10),
//                     color: primaryColor,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Add to Cart",
//                       // style: TextStyle(color: Colors.white),
//                       style: kWhiteBoldTextStyle(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             Navigator.pushNamed(
//               context,
//               PackageScreen.id,
//             );
//           },
//         ),
//         kSizedBox(),
//       ],
//     );
//   }
// }

// class HealthTile extends StatelessWidget {
//   String? image;
//   String? title;
//   String? price;
//   String? discountedPrice;
//   int? parameters;
//   final String? slug;
//   final HomeState state;
//   HealthTile({
//     required this.state,
//     this.slug,
//     this.image,
//     this.discountedPrice,
//     this.price,
//     this.title,
//     this.parameters,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           child: Container(
//             width: 160,
//             padding: kPadding(),
//             decoration: BoxDecoration(
//               border: Border.all(
//                   width: 1, color: Color.fromARGB(255, 204, 204, 204)),

//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               // boxShadow: [
//               //   BoxShadow(
//               //     color: const Color.fromARGB(255, 196, 196, 196),
//               //     blurRadius: 2.0, // soften the shadow
//               //     spreadRadius: 1.3, //extend the shadow
//               //     offset: Offset(
//               //       2.0,
//               //       2,
//               //     ),
//               //   )
//               // ],
//               //    boxShadow: [
//               //   BoxShadow(
//               //     color: Color.fromARGB(255, 198, 196, 196),
//               //     blurRadius: 2,
//               //     offset: Offset(0, 3),
//               //   ),
//               // ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: sPadding,
//                   height: 70,
//                   width: 70,
//                   child: Center(
//                     // child: Image.asset(
//                     //   'assets/images/kidney.png',
//                     //   scale: 0.8,
//                     // ),
//                     child: Image.network(
//                       image!,
//                       height: 50,
//                       width: 50,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) {
//                           return child;
//                         } else {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: primaryColor,
//                             ),
//                           );
//                         }
//                       },
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 sSizedBox(),
//                 Text(
//                   // 'Complete Care \nKidney',
//                   title!,
//                   style: kBoldTextStyle(),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//                 sSizedBox(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       // 'Rs.5,500',
//                       'Rs. $discountedPrice',
//                       style: kBoldTextStyle(),
//                     ),
//                     minWidthSpan(),
//                     Text(
//                         // 'Rs.7,500',
//                         'Rs.$price',
//                         style: kUnderline()),
//                   ],
//                 ),
//                 sSizedBox(),
//                 Row(
//                   children: [
//                     Text(
//                       '$parameters Parameters',
//                       style: kBoldTextStyle(),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ],
//                 ),
//                 kSizedBox(),
//                 InkWell(
//                   onTap: () {
//                     if (state.token == null) {
//                       ToastService()
//                           .e('You have to login to access this feature');
//                     } else {
//                       state.postCart(slug!, 'package');
//                     }
//                   },
//                   child: Container(
//                     width: 160,
//                     padding: sPadding,
//                     decoration: BoxDecoration(
//                       border: Border.all(width: 1, color: primaryColor),
//                       borderRadius: BorderRadius.circular(10),
//                       color: primaryColor,
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Add to Cart",
//                         // style: TextStyle(color: Colors.white),
//                         style: kWhiteBoldTextStyle(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             Navigator.pushNamed(context, PackageScreen.id,
//                 arguments: {'slug': slug, 'title': title});
//           },
//         ),
//         kSizedBox(),
//       ],
//     );
//   }
// }
