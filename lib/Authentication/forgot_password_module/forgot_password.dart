import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../../constant/constant.dart';
import '../Otp_Module/otp_screen.dart';
import 'forgot_password_state.dart';

class ForgotPassword extends StatelessWidget {
  static const String id = 'ForgotPassword';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ForgotPasswordState>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: MediaQuery.of(context).size.height * 0.05),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/forgot_password.png'),
                    kSizedBox(),
                    Text(
                        'Enter your email address and we will send you to a link to reset your password.'),
                  ],
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.05,
              // ),
              LSizedBox(),
              Text(
                'Email Address',
                style: kkTextStyle().copyWith(color: primaryColor),
              ),
              kSizedBox(),
              TextFormField(
                onChanged: state.onEmailChange,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: primaryColor,
                  ),
                  hintText: 'Email',
                  hintStyle: kTextStyle().copyWith(color: Colors.grey),
                  isDense: true,
                  filled: true,
                  fillColor: primaryColor.withOpacity(0.1),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              InkWell(
                onTap: state.submitLoading
                    ? null
                    : () {
                        state.onForgotPassword();
                        // Navigator.pushNamed(context, OtpScreen.id);
                        // FocusScope.of(context).unfocus();
                        // state.createAccount(context);
                      },
                // onTap: () {
                //   state.onForgotPassword();
                // },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                    gradient: state.submitLoading
                        ? LinearGradient(
                            colors: [
                                primaryColor.withOpacity(0.5),
                                blueColor.withOpacity(0.5)
                              ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)
                        : LinearGradient(
                            colors: [primaryColor, blueColor],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Send Me The Link',
                          style: kkWhiteBoldTextStyle().copyWith(fontSize: 18)),
                      minWidthSpan(),
                      if (state.submitLoading)
                        const SizedBox(
                          height: 25,
                          width: 25,
                          child: Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
