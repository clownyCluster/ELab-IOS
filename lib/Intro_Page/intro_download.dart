import 'package:elab/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroDownload extends StatelessWidget {
  const IntroDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: kStandardPadding(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/homeintro.png'),
              LSizedBox(),
              Text(
                'Download your report \n  anywhere anytime',
                style: kkBoldTextStyle().copyWith(fontSize: 30),
              ),
              kSizedBox(),
              Text(
                "Don’t wait for collecting the reports",
                style: kkTextStyle().copyWith(color: Colors.grey[400]),
              ),
              Text(' physically as you can download your',
                  style: kkTextStyle().copyWith(color: Colors.grey[400])),
              Text('report right away from the app',
                  style: kkTextStyle().copyWith(color: Colors.grey[400]))
            ],
          ),
        ),
      ),
    );
  }
}
