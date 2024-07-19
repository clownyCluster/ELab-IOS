import 'package:elab/Intro_Page/intro_download.dart';
import 'package:elab/Intro_Page/intro_page_home_module.dart';
import 'package:elab/Intro_Page/intro_upload.dart';
import 'package:elab/constant/constant.dart';
// import 'package:elab/screen/HomeScreenModule/home_screen.dart';
import 'package:elab/screen/onBoadingModule/on_boarding_state.dart';
// import 'package:elab/screen/splashModule/splash_screen.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../HomeModule/home_display.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static const String id = 'OnBoardingScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OnBoardingState>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: state.pageController,
            children: [
              IntroDownload(),
              IntroHomeModule(),
              IntroUpload(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child:
                SmoothPageIndicator(controller: state.pageController, count: 3),
          ),
          Container(
              alignment: Alignment(0, 0.88),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeDisplay.id, (route) => false);
                  },
                  child: Text(
                    'Skip To Home',
                    style: kkBoldTextStyle(),
                  ))),
          kSizedBox(),
        ],
      ),
    );
  }
}
