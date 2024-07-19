import 'package:elab/constant/constant.dart';
import 'package:elab/pages/PaymentModule/payment_state.dart';
import 'package:elab/screen/HomeModule/home_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../NoInternet/no_internet_screen.dart';

class PaymentScreen extends StatelessWidget {
  static const String id = 'PaymentScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PaymentState>(context);
    return Scaffold(
      appBar: defaultAppBar('Payment'),
      body: Container(
          padding: kStandardPadding(),
          child: Column(
            children: [
              Center(
                child: state.isNetConnected == false
                    ? ConnectivityScreen()
                    : state.ispayment == true
                        ? Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                ),
                                Image.asset(
                                  'assets/images/paymentsuccessfull.png',
                                ),
                                kSizedBox(),
                                Text(
                                  'Your payment was successfully completed.\n Your order has been successfully placed.',
                                  style: kBoldTextStyle(),
                                ),
                                LSizedBox(),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeDisplay.id, (route) => false);
                                  },
                                  child: Container(
                                    padding: kStandardPadding(),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: primaryColor),
                                        borderRadius: BorderRadius.circular(5),
                                        color: primaryColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Go Back To Home',
                                          style: kWhiteBoldTextStyle(),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                ),
                                Image.asset(
                                  'assets/images/paymentunsuccessful.png',
                                ),
                                kSizedBox(),
                                Text(
                                  'Unfortunately. something went wrong with \nyour payment and could not be completed.',
                                  style: kBoldTextStyle(),
                                ),
                                LSizedBox(),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomeDisplay.id, (route) => false);
                                  },
                                  child: Container(
                                    padding: kStandardPadding(),
                                    width: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: primaryColor),
                                        borderRadius: BorderRadius.circular(5),
                                        color: primaryColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Go Back To Home',
                                          style: kWhiteBoldTextStyle(),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
              ),
            ],
          )),
    );
  }
}
