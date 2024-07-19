import 'package:elab/global.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:flutter/material.dart';

import '../Authentication/login_module/login_screen.dart';
import '../screen/HomeModule/home_display.dart';
import '../service/toast_service.dart';

SizedBox kSizedBox() => SizedBox(
      height: 10,
    );
SizedBox MSizedBox() => SizedBox(
      height: 15,
    );
SizedBox LSizedBox() => SizedBox(
      height: 20,
    );

SizedBox sSizedBox() => SizedBox(
      height: 5,
    );
SizedBox minWidthSpan() => const SizedBox(
      width: 5,
    );
SizedBox maxWidthSpan() => const SizedBox(
      width: 10,
    );
SizedBox largeWidthSpan() => const SizedBox(
      width: 20,
    );

EdgeInsets kStandardPadding() =>
    const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

EdgeInsets kPadding() => const EdgeInsets.all(10);
EdgeInsets kVerticalPadding() => const EdgeInsets.symmetric(vertical: 10);
EdgeInsets kHorizontalPadding() => const EdgeInsets.symmetric(horizontal: 10);

showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // insetPadding: EdgeInsets.zero,
              title: Text('Log Out!', style: kBoldTextStyle()),
              content: const Text('Are you sure you want to logout?'),

              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                    child: Text(
                      'Log Out',
                      style: kTextStyle().copyWith(color: primaryColor),
                    ),
                    onPressed: () async {
                      LocalStorageService().clear(LocalStorageKeys.accessToken);
                      LocalStorageService()
                          .clear(LocalStorageKeys.registerToken);
                      LocalStorageService().clear(LocalStorageKeys.googleToken);
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.id, (route) => false);
                      // isLoggedIn = false;
                    }),
              ],
            );
          },
        );
      });
}

Future<bool> showAppExitConfirmationDialog(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // insetPadding: EdgeInsets.zero,
              title: Text('Exit App!', style: kBoldTextStyle()),
              content: const Text('Are you sure you want to Exit App?'),

              actions: <Widget>[
                TextButton(
                  child: Text(
                    "Cancel",
                    style: kTextStyle().copyWith(color: Colors.grey),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                    child: Text(
                      'Exit',
                      style: kTextStyle().copyWith(color: primaryColor),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                    }),
              ],
            );
          },
        );
      });
  return exitApp ?? false;
}

showListDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 200,
              width: double.infinity,
            );
          },
        );
      });
}

Future<T?> showTopModalSheet<T>(BuildContext context, Widget child,
    {bool barrierDismissible = true}) {
  return showGeneralDialog<T?>(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 250),
    barrierLabel: MaterialLocalizations.of(context).dialogLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, _, __) => child,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        child: Column(
          children: [
            Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [child],
              ),
            )
          ],
        ),
        position: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
            .drive(
                Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero)),
      );
    },
  );
}

AppBar defaultAppBar(String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: kkWhiteBoldTextStyle(),
    ),
    backgroundColor: primaryColor,
  );
}

TextStyle kTextStyle() => TextStyle(
      fontFamily: 'Hanken',
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w300,
    );

TextStyle kkTextStyle() => TextStyle(
      // color: Colors.grey[800],
      color: Colors.black,
      fontFamily: 'Hanken',
      fontSize: 16,
    );

TextStyle kUnderline() => TextStyle(
      color: Colors.grey[800],
      fontFamily: 'Hanken',
      decoration: TextDecoration.lineThrough,
      fontSize: 11,
    );

TextStyle sTextStyle() => TextStyle(
      color: Colors.grey[800],
      fontFamily: 'Hanken',
      fontSize: 10,
    );

TextStyle kBoldTextStyle() => TextStyle(
      // color: Colors.grey[800],
      fontFamily: 'Hanken',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

TextStyle kWhiteBoldTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Hanken',
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

TextStyle kkBoldTextStyle() => TextStyle(
      // color: Colors.grey[800],
      fontFamily: 'Hanken',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

TextStyle kkWhiteBoldTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Hanken',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );

TextStyle tabsTextStyle() => TextStyle(
      color: Colors.white,
      fontFamily: 'Hanken',
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );

TextStyle sBoldTextStyle() => TextStyle(
      // color: Colors.white,
      fontFamily: 'Hanken',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

Color primaryColor = Color(0xFF283891).withOpacity(0.96);
Color secondaryColor = Color(0xFF58A854).withOpacity(0.96);

Color blueColor = Color(0xff1A469D);
Color darkGrey = Color.fromARGB(255, 14, 14, 15);
Color yellowColor = Color(0xffFFCF01);
Color errorColor = Colors.red;
Color whiteColor = Colors.white;

//#E5283C

Color successColor = Colors.green;

const kBottomContainerHeight = 80.0;
const kActiveCartColour = Color.fromARGB(255, 70, 72, 107);
const kInactiveCartColour = Color(0xFF111328);
const kBottomContainerColour = Color.fromARGB(255, 248, 0, 74);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color.fromARGB(255, 42, 42, 44),
);

const kNumberTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

String base_url = 'https://www.elabnepal.com/api/v1';
