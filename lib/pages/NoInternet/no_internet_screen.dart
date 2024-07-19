import 'package:elab/constant/constant.dart';
import 'package:elab/screen/HomeModule/home_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'no_interner_state.dart';

class ConnectivityScreen extends StatelessWidget {
  static const String id = 'ConnectivityScreen';
  @override
  Widget build(BuildContext context) {
    // final connectivityProvider = Provider.of<ConnectivityProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_outlined,
              size: 50,
            ),
            Text(
              'You are Offline',
              style: kkBoldTextStyle(),
            ),
            kSizedBox(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomeDisplay.id);
              },
              child: Container(
                padding: kStandardPadding(),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Try again',
                  style: kkWhiteBoldTextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
