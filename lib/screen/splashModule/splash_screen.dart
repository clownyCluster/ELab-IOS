// import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/pages/NoInternet/no_internet_screen.dart';
import 'package:elab/screen/splashModule/splassh_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SplashState>(context);
    return Scaffold(
      body: Container(
        padding: kStandardPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                // height: MediaQuery.of(context).size.height * 3.7 / 4,
                width:  MediaQuery.of(context).size.width* 0.89,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
