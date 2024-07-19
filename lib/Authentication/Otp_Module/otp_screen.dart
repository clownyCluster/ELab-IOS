import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../constant/k_button.dart';
import 'otp_state.dart';

class OtpScreen extends StatelessWidget {
  static const String id = "OtpScreen";

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OtpState>(context);
    return Scaffold(
      body: state.isButtonClicked == true
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Container(
              padding: kStandardPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter OTP",
                    style: kkBoldTextStyle().copyWith(fontSize: 24),
                  ),
                  kSizedBox(),
                  Center(
                      child: Text("Please Enter the OTP code provided to   ")),
                  sSizedBox(),
                  Text("your email address."),
                  LSizedBox(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: 60,
                  //       width: 60,
                  //       child: TextFormField(
                  //           controller: state.fieldOne,
                  //           decoration: InputDecoration(
                  //               border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //           ))),
                  //     ),
                  //     maxWidthSpan(),
                  //     Container(
                  //       height: 60,
                  //       width: 60,
                  //       child: TextFormField(
                  //           controller: state.fieldTwo,
                  //           decoration: InputDecoration(
                  //               border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //           ))),
                  //     ),
                  //     maxWidthSpan(),
                  //     Container(
                  //       height: 60,
                  //       width: 60,
                  //       child: TextFormField(
                  //           controller: state.fieldThree,
                  //           decoration: InputDecoration(
                  //               border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //           ))),
                  //     ),
                  //     maxWidthSpan(),
                  //     Container(
                  //       height: 60,
                  //       width: 60,
                  //       child: TextFormField(
                  //           controller: state.fieldFour,
                  //           decoration: InputDecoration(
                  //               border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //           ))),
                  //     ),
                  //   ],
                  // ),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (code) {},

                    onSubmit: (verificationCode) {
                      state.verifyOTP(verificationCode);
                    }, // end
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // OtpInput(state.fieldOne, true), // auto focus
                      // OtpInput(state.fieldTwo, true),
                      // OtpInput(state.fieldThree, true),
                      // OtpInput(state.fieldFour, true)
                    ],
                  ),
                  kSizedBox(),
                  Text("The provided OTP code will expire in 07:55 mins"),
                  kSizedBox(),
                  // KButton(
                  //     child: Text(
                  //       "Submit",
                  //       style: kBoldTextStyle(),
                  //     ),
                  //     size: ButtonSize.medium,
                  //     backgroundColor: primaryColor,
                  //     foregroundColor: Colors.white,
                  //     radius: 20,
                  //     onPressed: () {
                  //       // state.verifyOTP();
                  //     }),
                  kSizedBox(),
                  Text("If the OTP code has not arrived or has expired,"),
                  kSizedBox(),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "click here to send a new code.",
                          style: kBoldTextStyle().copyWith(color: primaryColor),
                        ),
                        minWidthSpan(),
                        if (state.isButtonClicked)
                          const SizedBox(
                            height: 25,
                            width: 25,
                            child: Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      state.resentOtp();
                    },
                  )
                ],
              )),
    );
  }
}
