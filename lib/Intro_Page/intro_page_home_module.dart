import 'package:elab/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroHomeModule extends StatelessWidget {
  const IntroHomeModule({super.key});

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
              Image.asset('assets/images/bookintro.png'),
              LSizedBox(),
              Text(
                'Book a Home Collection',
                style: kkBoldTextStyle().copyWith(fontSize: 30),
              ),
              kSizedBox(),
              Text(
                "You can book for a home collection at",
                style: kkTextStyle().copyWith(color: Colors.grey[400]),
              ),
              Text('your own ease and comfort anytime',
                  style: kkTextStyle().copyWith(color: Colors.grey[400])),
              Text('anywhere from the app',
                  style: kkTextStyle().copyWith(color: Colors.grey[400])),
                  kSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
