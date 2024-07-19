// import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/pages/AccountModule/account_screen.dart';
import 'package:elab/pages/OrdesHistoryModule/orders_screen.dart';
import 'package:elab/pages/ReportModule/report_screen.dart';
import 'package:elab/pages/UpdatePassword/update_password.dart';
import 'package:elab/pages/Upload_Prescription_Module/upload_screen.dart';
// import 'package:elab/screen/HomeModule/home_display.dart';
// import 'package:elab/screen/HomeModule/home_display_state.dart';
import 'package:elab/screen/ProfileModule/profile_state.dart';
// import 'package:elab/screen/splashModule/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Authentication/login_module/login_screen.dart';
import '../../pages/NoInternet/no_internet_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProfileState>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: defaultAppBar('Profile'),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.token == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You have to login to access this feature'),
                      LSizedBox(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginScreen.id, (route) => false);
                          },
                          child: Text('Proceed to Login'))
                    ],
                  ),
                )
              : state.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        padding: kStandardPadding(),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: kPadding(),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        child: state.profileResponse!.data!
                                                    .profilePic ==
                                                null
                                            ? Image.asset(
                                                'assets/images/userprofile.png')
                                            : CircleAvatar(
                                                backgroundImage: state
                                                        .profileResponse!
                                                        .data!
                                                        .profilePic!
                                                        .isEmpty
                                                    ? AssetImage(
                                                        'assets/icon/loading.gif')
                                                    : AssetImage(
                                                        'assets/images/profile.png'),
                                                radius: 25,
                                                child: Container(
                                                    height: 50,
                                                    width: 50,
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
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, AccountScreen.id);
                                        },
                                      ),
                                      maxWidthSpan(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.profileResponse!.data!.name!,
                                            style: kWhiteBoldTextStyle(),
                                          ),
                                          Text(
                                              state.profileResponse!.data!
                                                  .email!,
                                              style: kWhiteBoldTextStyle()),
                                          Text(
                                              state.profileResponse!.data!
                                                  .contact!,
                                              style: kWhiteBoldTextStyle()),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    child:
                                        Image.asset('assets/images/edit.png'),
                                    onTap: () {
                                      // Navigator.pushNamed(context, ProfilePage.id);
                                      Navigator.pushNamed(
                                          context, AccountScreen.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            LSizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, OrderScreen.id);
                                  },
                                  child: Container(
                                    height: 75,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    padding: kPadding(),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 162, 161, 161))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Orders',
                                              style: kkBoldTextStyle(),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.orderModelResponse!.data!.length
                                              .toString(),
                                          style: kkBoldTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ReportScreen.id);
                                  },
                                  child: Container(
                                    height: 75,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    padding: kPadding(),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 162, 161, 161)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Reports",
                                              style: kkBoldTextStyle(),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state
                                              .reportModelResponse!.data!.length
                                              .toString(),
                                          style: kkBoldTextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kSizedBox(),
                            Container(
                              padding: kPadding(),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 196, 196, 196),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.3, //extend the shadow
                                    offset: Offset(
                                      2.0,
                                      2,
                                    ),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/document.png',
                                            ),
                                            maxWidthSpan(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'My Reports',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Text(
                                                  'View all your reports for your account',
                                                  style: kTextStyle().copyWith(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.5),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ReportScreen.id);
                                    },
                                  ),
                                  sSizedBox(),
                                  Divider(
                                    // height: 5,
                                    thickness: 0.8,
                                    color: Colors.grey[400],
                                  ),
                                  sSizedBox(),
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/cart.png',
                                            ),
                                            maxWidthSpan(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'My Orders',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Text(
                                                  'A record of all your order history.',
                                                  style: kTextStyle().copyWith(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.5),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, OrderScreen.id);
                                    },
                                  ),
                                  sSizedBox(),
                                  Divider(
                                    // height: 5,
                                    thickness: 0.8,
                                    color: Colors.grey[400],
                                  ),
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/upload-icon.png',
                                            ),
                                            maxWidthSpan(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'My Uploads',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Text(
                                                  'All your prescription uploads.',
                                                  style: kTextStyle().copyWith(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.5),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          UploadePrescriptionScreen.id);
                                    },
                                  ),
                                  sSizedBox(),
                                  // Divider(
                                  //   // height: 5,
                                  //   thickness: 0.8,
                                  //   color: Colors.grey[400],
                                  // ),
                                  // InkWell(
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Row(
                                  //         children: [
                                  //           Image.asset(
                                  //             'assets/images/address.png',
                                  //           ),
                                  //           maxWidthSpan(),
                                  //           minWidthSpan(),
                                  //           Column(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             children: [
                                  //               Text(
                                  //                 'My Address',
                                  //                 style: kkBoldTextStyle()
                                  //                     .copyWith(fontSize: 15),
                                  //               ),
                                  //               Text(
                                  //                 'View all your reports for your account',
                                  //                 style: kTextStyle().copyWith(
                                  //                     color: Colors.grey[600],
                                  //                     fontSize: 11.5),
                                  //               )
                                  //             ],
                                  //           )
                                  //         ],
                                  //       ),
                                  //       Icon(
                                  //         Icons.arrow_forward_ios,
                                  //         size: 18,
                                  //         color: Colors.grey,
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   onTap: () {
                                  //     Navigator.pushNamed(context, AddressScreen.id);
                                  //   },
                                  // ),
                                  sSizedBox(),
                                  state.googleToken == null
                                      ? Divider(
                                          // height: 5,
                                          thickness: 0.8,
                                          color: Colors.grey[400],
                                        )
                                      : SizedBox(),
                                  state.googleToken == null
                                      ? InkWell(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/password.png',
                                                  ),
                                                  maxWidthSpan(),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'My Password',
                                                        style: kkBoldTextStyle()
                                                          ..copyWith(
                                                              fontSize: 15),
                                                      ),
                                                      Text(
                                                        'Update your account password',
                                                        style: kTextStyle()
                                                            .copyWith(
                                                                color: Colors
                                                                    .grey[600],
                                                                fontSize: 11.5),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                UpdatePasswordScreen.id);
                                          },
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            LSizedBox(),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 196, 196, 196),
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 1.3, //extend the shadow
                                    offset: Offset(
                                      2.0, // Move to right 5  horizontally
                                      2.0, // Move to bottom 5 Vertically
                                    ),
                                  ),
                                ],
                              ),
                              padding: kPadding(),
                              child: Column(
                                children: [
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              'assets/images/profile-icon.png',
                                            ),
                                            maxWidthSpan(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'My Account Information',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Text(
                                                  'Update you account inforation.',
                                                  style: kTextStyle().copyWith(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.5),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AccountScreen.id);
                                    },
                                  ),
                                  sSizedBox(),
                                  Divider(
                                    // height: 5,
                                    thickness: 0.8,
                                    color: Colors.grey[400],
                                  ),
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              'assets/images/logout.png',
                                            ),
                                            maxWidthSpan(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Log Out',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Text(
                                                  'Logout of your account.',
                                                  style: kTextStyle().copyWith(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.5),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      showLogoutConfirmationDialog(context);
                                      // Navigator.popAndPushNamed(context, LoginScreen.id);
                                    },
                                  ),
                                  kSizedBox(),
                                  Divider(
                                    // height: 5,
                                    thickness: 0.8,
                                    color: Colors.grey[400],
                                  ),
                                  sSizedBox(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          state.onDelecteAccountDialog(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            maxWidthSpan(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Delete Account',
                                                  style: kkBoldTextStyle()
                                                      .copyWith(fontSize: 15),
                                                ),
                                                Text(
                                                  'Your account will be deleted',
                                                  style: kTextStyle().copyWith(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.5),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
}
