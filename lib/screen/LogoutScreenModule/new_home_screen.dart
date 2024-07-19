import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/Drawer_Pages/Drawer_Model/drawer_screen.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/pages/History_Detials_Module/history_screen.dart';
import 'package:elab/pages/Home_Collection_Module/home_collection_screen.dart';
import 'package:elab/pages/ReportModule/report_screen.dart';
import 'package:elab/screen/LogoutScreenModule/new_home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Authentication/register_module/register_screen.dart';
import '../../Drawer_Pages/AboutUs_Module/about_us_screen.dart';
import '../../Drawer_Pages/Blogs_Module/blog_screen.dart';
import '../../constant/k_button.dart';
import '../../constant/ui_helpers.dart';
import '../../pages/HealthPackagesModule/health_packages_screen.dart';
import '../../pages/RequestCallback_Module/callback_screen.dart';
import '../../pages/TestsModule/individule_test_screen.dart';
import '../../pages/Upload_Prescription_Module/upload_screen.dart';
import '../../service/toast_service.dart';
import '../OfferModule/offer_screen.dart';

class NewHomeScreen extends StatelessWidget {
  const NewHomeScreen({super.key});
  static const String id = "NewHomeScreen";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<NewHomeState>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          title: Container(
              height: 70,
              width: 70,
              child: Image.asset('assets/images/logo.png'))),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: kStandardPadding(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        state.token == null
                            ? Image.asset('assets/images/userprofile.png')
                            // : state.profile!.isEmpty
                            //     ? Image.asset(
                            //         'assets/images/userprofile.png')
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/icon/loading.gif'),
                                radius: 30,
                                child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                              .profileResponse!
                                              .data!
                                              .profilePic!),
                                          fit: BoxFit.cover),
                                    )),
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            state.token == null
                                ? Text(
                                    'Hi, Guest',
                                    style: kkBoldTextStyle(),
                                  )
                                : Text(
                                    state.profileResponse!.data!.name!,
                                    style: kkBoldTextStyle(),
                                  ),
                            kSizedBox(),
                            state.token == null
                                ? Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, RegisterScreen.id);
                                        },
                                        child: Container(
                                          padding: kPadding(),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                          ),
                                          child: Text(
                                            'Sign up',
                                            style: kWhiteBoldTextStyle(),
                                          ),
                                        ),
                                      ),
                                      maxWidthSpan(),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, LoginScreen.id);
                                        },
                                        child: Container(
                                          padding: kPadding(),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red,
                                          ),
                                          child: Text(
                                            'Login',
                                            style: kWhiteBoldTextStyle(),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : InkWell(
                                    onTap: () {
                                      showLogoutConfirmationDialog(context);
                                    },
                                    child: Container(
                                      padding: kPadding(),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: primaryColor,
                                      ),
                                      child: Text(
                                        'Log Out',
                                        style: kWhiteBoldTextStyle(),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ],
                    ),
                    LSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DrawerTile(
                          image: 'assets/icon/health.png',
                          name: '  Health \nPackages',
                          // height: 140,
                          // width: 10,
                          onTap: () {
                            Navigator.pushNamed(
                                context, HealthPackagesScreen.id);
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/test.png',
                          name: 'Our Tests',
                          onTap: () {
                            Navigator.pushNamed(
                                context, IndividuleTestScreen.id);
                          },
                        ),
                        DrawerTile(
                          image: 'assets/images/home_col.png',
                          name: 'Book A Home Collection',
                          onTap: () {
                            if (state.token == null) {
                              ToastService().e(
                                  'You have to login to access this feature');
                            } else {
                              Navigator.pushNamed(
                                  context, UploadePrescriptionScreen.id);
                            }
                          },
                        ),
                      ],
                    ),
                    kSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DrawerTile(
                          image: 'assets/icon/download.png',
                          name: 'Download \nReports',
                          onTap: () {
                            if (state.token == null) {
                              ToastService().e(
                                  'You have to login to access this feature');
                            } else {
                              navigator!.pushNamed(ReportScreen.id);
                            }
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/upload.png',
                          name: 'Upload a \nprescription',
                          onTap: () {
                            if (state.token == null) {
                              ToastService().e(
                                  'You have to login to access this feature');
                            } else {
                              Navigator.pushNamed(
                                  context, UploadePrescriptionScreen.id);
                            }
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/offers.png',
                          name: 'Offers',
                          onTap: () {
                            Navigator.pushNamed(context, OfferScreen.id);
                          },
                        ),
                      ],
                    ),
                    kSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DrawerTile(
                          image: 'assets/icon/phone.png',
                          name: '     Call Us: \n9851358000',
                          onTap: () {
                            state.makePhoneCall();
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/mail.png',
                          name: 'mail@mailc\nompany.com',
                          onTap: () {
                            state.openEmail(state.extraResponse!.data!.email);
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/map.png',
                          name: 'Kathmandu,\nNepal',
                          onTap: () {
                            state.launchGoogleMaps(
                                state.extraResponse!.data!.googlemap);
                          },
                        ),
                      ],
                    ),
                    kSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DrawerTile(
                          image: 'assets/icon/test.png',
                          name: 'My History',
                          onTap: () {
                            Navigator.pushNamed(context, HistoryScreen.id);
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/blog.png',
                          name: 'Blogs',
                          onTap: () {
                            Navigator.pushNamed(context, BlogsScreen.id);
                          },
                        ),
                        DrawerTile(
                          image: 'assets/icon/about.png',
                          name: '  About Us',
                          onTap: () {
                            Navigator.pushNamed(context, AboutUsScreen.id);
                          },
                        ),
                      ],
                    ),
                    kSizedBox(),
                    // Container(
                    //   padding: kPadding(),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.white,
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         color: Color.fromARGB(255, 204, 204, 204),

                    //         blurRadius: 2.0, // soften the shadow
                    //         spreadRadius: 1.3, //extend the shadow
                    //         offset: Offset(
                    //           2.0, // Move to right 5  horizontally
                    //           2.0, // Move to bottom 5 Vertically
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Center(
                    //           child:
                    //               Image.asset('assets/images/call-girl.png')),
                    //       kSizedBox(),
                    //       Text(
                    //         'Request A Callback',
                    //         style: kkBoldTextStyle(),
                    //       ),
                    //       LSizedBox(),
                    //       Text(
                    //         'Have any queries or questions ? Send them our way and we will get back to you within 24 hrs.',
                    //         style: kBoldTextStyle(),
                    //       ),
                    //       LSizedBox(),
                    //       KButton(
                    //         child: Text(
                    //           'Request A Callback',
                    //           style: kWhiteBoldTextStyle(),
                    //         ),
                    //         onPressed: () {
                    //           if (state.token == null) {
                    //             Navigator.pushNamedAndRemoveUntil(
                    //                 context, LoginScreen.id, (route) => false);
                    //             ToastService().e(
                    //                 'You have to login to access this feature');
                    //           } else {
                    //             Navigator.pushNamed(
                    //                 context, RequestCallBackScreen.id);
                    //           }
                    //         },
                    //         backgroundColor: primaryColor,
                    //         radius: 10,
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}

class HomeTile extends StatelessWidget {
  String? image;
  String? name;
  void Function() onTap;
  double? height;
  double? width;

  HomeTile({
    required this.onTap,
    this.image,
    this.name,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 110,
        height: height ?? 100,
        padding: sPadding,
        decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: Color.fromARGB(255, 204, 204, 204)),
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: 50,
              child: Image.asset(image!),
            ),
            Text(
              name!,
              overflow: TextOverflow.ellipsis,
              style: kkTextStyle().copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
