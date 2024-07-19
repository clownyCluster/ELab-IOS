import 'package:elab/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroUpload extends StatelessWidget {
  const IntroUpload({super.key});

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
              Image.asset('assets/images/uploadintro.png'),
              LSizedBox(),
              Text(
                'Upload your prescription',
                style: kkBoldTextStyle().copyWith(fontSize: 30),
              ),
              kSizedBox(),
              Text(
                "Confused about how to book a test? ",
                style: kkTextStyle().copyWith(color: Colors.grey[400]),
              ),
              Text('Upload your prescription and we will call',
                  style: kkTextStyle().copyWith(color: Colors.grey[400])),
              Text('you right away to assist you in your test ',
                  style: kkTextStyle().copyWith(color: Colors.grey[400])),
              Text('booking',
                  style: kkTextStyle().copyWith(color: Colors.grey[400]))
            ],
          ),
        ),
      ),
    );
  }
}
