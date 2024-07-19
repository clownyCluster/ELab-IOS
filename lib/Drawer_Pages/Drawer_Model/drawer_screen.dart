import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/Authentication/register_module/register_screen.dart';
import 'package:elab/Drawer_Pages/Drawer_Model/drawer_state.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/Home_Collection_Module/home_collection_screen.dart';
import 'package:elab/pages/Home_Collection_Module/home_collection_state.dart';
import 'package:elab/pages/Medical_History/medical_history.dart';
import 'package:elab/pages/ReportModule/report_screen.dart';
import 'package:elab/pages/RequestCallback_Module/callback_screen.dart';
import 'package:elab/screen/OfferModule/offer_screen.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../ApiModel/home_collection_model.dart';
import '../../constant/utils.dart';
import '../../pages/HealthPackagesModule/health_packages_screen.dart';
import '../../pages/History_Detials_Module/history_screen.dart';
import '../../pages/NoInternet/no_internet_screen.dart';
import '../../pages/TestsModule/individule_test_screen.dart';
import '../../pages/Upload_Prescription_Module/upload_screen.dart';
import '../AboutUs_Module/about_us_screen.dart';
import '../Blogs_Module/blog_screen.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  static const String id = 'DrawerScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DrawerState>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          title: Container(
              height: 70,
              width: 70,
              child: Image.asset('assets/images/logo.png'))),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: kStandardPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RequestCallBackScreen.id);
                          },
                          child: Container(
                            padding: sPadding,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Color.fromARGB(255, 207, 205, 205),
                                    offset: Offset(3, 3))
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    state.token == null
                                        ? Image.asset(
                                            'assets/images/userprofile.png')
                                        : CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/icon/loading.gif',
                                            ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Good ${state.getTimeOfDay()} ',
                                              style: kkBoldTextStyle()
                                                  .copyWith(fontSize: 15),
                                            ),
                                            state.token == null
                                                ? Text(
                                                    'Guest !',
                                                    style: kkBoldTextStyle()
                                                        .copyWith(fontSize: 15),
                                                  )
                                                : Container(
                                                    width: 120,
                                                    child: Text(
                                                      '${state.profileResponse!.data!.name!} !',
                                                      style: kkBoldTextStyle()
                                                          .copyWith(
                                                              fontSize: 15),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        Text(
                                          'How Are you feeling today?',
                                          style: kkTextStyle(),
                                        ),
                                        sSizedBox(),
                                        Container(
                                          height: 2,
                                          width: 230,
                                          color: const Color.fromARGB(
                                              255, 202, 201, 198),
                                        ),
                                        sSizedBox(),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              size: 14,
                                            ),
                                            maxWidthSpan(),
                                            Text('Request A Call Back'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [

                        // state.token == null
                        //     ? Image.asset('assets/images/userprofile.png')
                        //     // : state.profileResponse!.data!.profilePic!.isEmpty
                        //     //     ? Image.asset(
                        //     //         'assets/images/userprofile.png')
                        //     : CircleAvatar(
                        //         backgroundImage: AssetImage(
                        //           'assets/images/profile-icon.png',
                        //         ),
                        //         radius: 30,
                        //         child: Container(
                        //             height: 60,
                        //             width: 60,
                        //             decoration: BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               image: DecorationImage(
                        //                   image: NetworkImage(state
                        //                       .profileResponse!
                        //                       .data!
                        //                       .profilePic!),
                        //                   fit: BoxFit.cover),
                        //             )),
                        //       ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     state.token == null
                        //         ? Text(
                        //             'Hi, Guest',
                        //             style: kkBoldTextStyle(),
                        //           )
                        //         : Text(
                        //             state.profileResponse!.data!.name!,
                        //             style: kkBoldTextStyle(),
                        //           ),
                        //     kSizedBox(),
                        //     state.token == null
                        //         ? Row(
                        //             children: [
                        //               InkWell(
                        //                 onTap: () {
                        //                   Navigator.pushNamed(
                        //                       context, RegisterScreen.id);
                        //                 },
                        //                 child: Container(
                        //                   padding: kPadding(),
                        //                   decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(10),
                        //                     color: primaryColor,
                        //                   ),
                        //                   child: Text(
                        //                     'Sign up',
                        //                     style: kWhiteBoldTextStyle(),
                        //                   ),
                        //                 ),
                        //               ),
                        //               maxWidthSpan(),
                        //               InkWell(
                        //                 onTap: () {
                        //                   Navigator.pushNamed(
                        //                       context, LoginScreen.id);
                        //                 },
                        //                 child: Container(
                        //                   padding: kPadding(),
                        //                   decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(10),
                        //                     color: Colors.red,
                        //                   ),
                        //                   child: Text(
                        //                     'Login',
                        //                     style: kWhiteBoldTextStyle(),
                        //                   ),
                        //                 ),
                        //               )
                        //             ],
                        //           )
                        //         : InkWell(
                        //             onTap: () {
                        //               showLogoutConfirmationDialog(context);
                        //             },
                        //             child: Container(
                        //               padding: sPadding,
                        //               width: 100,
                        //               decoration: BoxDecoration(
                        //                 borderRadius:
                        //                     BorderRadius.circular(10),
                        //                 color: primaryColor,
                        //               ),
                        //               child: Center(
                        //                 child: Text(
                        //                   'Log Out',
                        //                   style: kWhiteBoldTextStyle(),
                        //                 ),
                        //               ),
                        //             ),
                        //           )
                        //   ],
                        // ),
                        //   ],
                        // ),
                        LSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DrawerTile(
                                image: 'assets/icon/health.png',
                                name: '  Health \nPackages',
                                onTap: () {
                                  if (state.token == null) {
                                    navigator?.pushNamedAndRemoveUntil(
                                        LoginScreen.id, (route) => false);
                                  } else {
                                    Navigator.pushNamed(
                                        context, HealthPackagesScreen.id);
                                  }
                                }),
                            DrawerTile(
                              image: 'assets/icon/test.png',
                              name: 'Our Tests',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  Navigator.pushNamed(
                                      context, IndividuleTestScreen.id);
                                }
                              },
                            ),

                            DrawerTile(
                              image: 'assets/images/home_col.png',
                              name: ' Book A Home\n Collection',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  Navigator.pushNamed(
                                      context, HomeColloctionScreen.id);
                                }
                              },
                            ),
                            // DrawerTile(
                            //   image: 'assets/icon/upload.png',
                            //   name: 'Upload a \nprescription',
                            //   onTap: () {
                            //     if (state.token == null) {
                            //       ToastService().e(
                            //           'You have to login to access this feature');
                            //     } else {
                            //       Navigator.pushNamed(
                            //           context, UploadePrescriptionScreen.id);
                            //     }
                            //   },
                            // ),
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
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
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
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
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
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  Navigator.pushNamed(context, OfferScreen.id);
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
                              image: 'assets/icon/test.png',
                              name: ' My Medical \n History',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  Navigator.pushNamed(
                                      context, MedicalHistoryScreen.id);
                                }
                              },
                            ),
                            DrawerTile(
                              image: 'assets/icon/test.png',
                              name: 'Reports',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  Navigator.pushNamed(context, BlogsScreen.id);
                                }
                              },
                            ),
                            DrawerTile(
                              image: 'assets/icon/about.png',
                              name: '  About Us',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  Navigator.pushNamed(
                                      context, AboutUsScreen.id);
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
                              image: 'assets/icon/phone.png',
                              name: 'Call Us',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  state.makePhoneCall();
                                }
                              },
                            ),
                            DrawerTile(
                              image: 'assets/icon/mail.png',
                              name: 'mail',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  state.openEmail(
                                      state.extraResponse!.data!.email!);
                                }
                              },
                            ),
                            DrawerTile(
                              image: 'assets/icon/map.png',
                              name: 'Kathmandu,\nNepal',
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  state.launchGoogleMaps(
                                      state.extraResponse!.data!.googlemap);
                                }
                              },
                            ),
                          ],
                        ),
                        kSizedBox(),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        kSizedBox(),
                        Center(
                          child: Text(
                            'Connect with us ',
                            style: kkBoldTextStyle(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                state.openFacebook(
                                    state.extraResponse!.data!.facebookUrl!);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/icon/facebook.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            maxWidthSpan(),
                            InkWell(
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {
                                  state.openInstagram(
                                      state.extraResponse!.data!.instagramUrl!);
                                }
                              },
                              child: Image.asset(
                                'assets/images/instagramLogo.png',
                                height: 35,
                              ),
                            ),
                            maxWidthSpan(),
                            maxWidthSpan(),

                            InkWell(
                                onTap: () {
                                  if (state.token == null) {
                                    navigator?.pushNamedAndRemoveUntil(
                                        LoginScreen.id, (route) => false);
                                  } else {
                                    state.openLikedInUrl(state
                                        .extraResponse!.data!.linkedInUrl!);
                                  }
                                },
                                child: Image.asset(
                                  'assets/icon/linkedin.png',
                                  height: 33,
                                )),
                            maxWidthSpan(),
                            maxWidthSpan(),

                            InkWell(
                              onTap: () {
                                if (state.token == null) {
                                  navigator?.pushNamedAndRemoveUntil(
                                      LoginScreen.id, (route) => false);
                                } else {}
                              },
                              child: Image.asset(
                                'assets/images/youtube.png',
                                height: 35,
                                // width: 35,
                              ),
                            ),
                            maxWidthSpan(),
                            maxWidthSpan(),
                            // InkWell(
                            //   onTap: () {
                            //     state.openWhatsApp();
                            //   },
                            //   // child: Image.asset(
                            //   //   'assets/images/whatsapp.png',
                            //   //   height: 30,
                            //   // ),
                            // ),
                            // maxWidthSpan(),
                            // InkWell(
                            //   onTap: () {
                            //     state.openTikTok(
                            //         state.extraResponse!.data!.twitterUrl!);
                            //   },
                            //   child: Image.asset(
                            //     'assets/images/tiktok.png',
                            //     height: 40,
                            //   ),
                            // )
                          ],
                        ),
                        kSizedBox(),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        kSizedBox(),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     SocialTile(
                        //       image: 'assets/images/facebook.png',
                        //       name: 'Facebook',
                        //       onTap: () {
                        //         state.openFacebook(
                        //             state.extraResponse?.data?.facebookUrl);
                        //       },
                        //     ),
                        //     SocialTile(
                        //       image: 'assets/images/whatsapp.png',
                        //       name: 'Whatsapp',
                        //       onTap: () {
                        //         state.openWhatsApp(
                        //             state.extraResponse?.data?.whatsApp);
                        //       },
                        //     ),
                        //     SocialTile(
                        //       image: 'assets/images/logout.png',
                        //       name: 'Logout',
                        //       onTap: () {
                        //         Navigator.pushNamedAndRemoveUntil(
                        //             context, LoginScreen.id, (route) => false);
                        //       },
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  String? image;
  String? name;
  double? height;
  double? width;

  void Function() onTap;

  DrawerTile({
    super.key,
    this.image,
    this.name,
    this.height,
    this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 115,
        width: width ?? MediaQuery.of(context).size.width * 0.28,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        padding: sPadding,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                image!,
                height: 45,
                width: 50,
                color: Colors.black,
              ),
            ),
            kSizedBox(),
            Text(
              name!,
              style: kTextStyle(),
            )
          ],
        ),
      ),
    );
  }
}

class SocialTile extends StatelessWidget {
  String? image;
  String? name;

  void Function() onTap;

  SocialTile({
    super.key,
    this.image,
    this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 105,
        width: 105,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        padding: sPadding,
        child: Column(
          children: [
            // Image.asset('assets/icon/health.png'),
            Image.asset(
              image!,
              height: 40,
              width: 50,
            ),

            kSizedBox(),
            Text(
              name!,
              style: kTextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
