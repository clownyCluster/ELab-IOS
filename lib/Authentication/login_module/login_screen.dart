// import 'package:elab/screen/HomeModule/home_display.dart';
// import 'package:elab/screen/HomeScreenModule/home_screen.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constant/constant.dart';
// import '../../constant/helper.dart';
import '../forgot_password_module/forgot_password.dart';
import '../register_module/register_screen.dart';
import 'login_state.dart';

bool canPop(BuildContext context) {
  final NavigatorState? navigator = Navigator.maybeOf(context);
  return navigator != null && navigator.canPop();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginState>(context);

    // faceBookLogin() {
    //   Navigator.pushNamed(context, HomeScreen.id);
    // }

    // appleLogin() {}

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: MediaQuery.of(context).size.height * 0.05),
              child: Form(
                key: state.formKey,
                child: ListView(
                  children: [
                    LSizedBox(),
                    LSizedBox(),

                    Center(
                      child: Text(
                        'Welcome to Elab Service',
                        style: kkBoldTextStyle().copyWith(fontSize: 22),
                      ),
                    ),
                    // kSizedBox(),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 250,
                    ),
                    sSizedBox(),
                    Center(
                        child: Text(
                      'SIGN IN',
                      style: kkBoldTextStyle().copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: primaryColor),
                    )),
                    kSizedBox(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "Add your details to login",
                    //       style: kTextStyle().copyWith(
                    //         fontWeight: FontWeight.w400,
                    //         fontSize: 14,
                    //         color: Colors.grey,
                    //       ),
                    //     )
                    //   ],
                    // ),

                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    // ),
                    Text(
                      'Email Address',
                      style: TextStyle(color: primaryColor),
                    ),
                    kSizedBox(),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: state.onEmailChanged,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: primaryColor,
                        ),
                        isDense: true,
                        hintText: ' Email Address',
                        // labelText: 'Enter your Email Address',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[500]),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        RegExp mail = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        if (value == null || value.isEmpty) {
                          return "Email is required!";
                        } else if (!mail.hasMatch(value)) {
                          return "Please provide valid email!";
                        }
                        return null;
                      },
                    ),
                    LSizedBox(),
                    Text(
                      'Password',
                      style: TextStyle(color: primaryColor),
                    ),
                    kSizedBox(),
                    TextFormField(
                      onChanged: state.onPasswordChanged,
                      obscureText: state.isPasswordVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: primaryColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: state.onVisibilityChanged,
                          icon: state.isPasswordVisible
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                        ),
                        hintText: 'Enter you Password',
                        hintStyle: kTextStyle().copyWith(color: Colors.grey),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        // RegExp upperCase = RegExp(r'(?=.*?[A-Z])');
                        // RegExp lowerCase = RegExp(r'(?=.*?[a-z])');
                        // RegExp number = RegExp(r'(?=.*?[0-9])');
                        // RegExp special = RegExp(r'^[a-zA-Z0-9]+$');
                        if (value == null || value.isEmpty) {
                          return "Password is required!";
                          // } else if (!upperCase.hasMatch(value)) {
                          //   return "Please use at least one Upper case letter!";
                          // } else if (!lowerCase.hasMatch(value)) {
                          //   return "Please use at least one Lower case letter!";
                          // } else if (!number.hasMatch(value)) {
                          //   return "Please use at least one number!";
                          // } else if (special.hasMatch(value)) {
                          //   return "Please use at least one special character!";
                        }
                        return null;
                      },
                    ),
                    sSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ForgotPassword.id);
                          },
                          child: Text(
                            "Forgot your Password ?",
                            style: kTextStyle().copyWith(
                              // decoration: TextDecoration.underline,

                              fontSize: 14,
                              color: primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),

                    kSizedBox(),
                    // Button(
                    //   name: 'Create Account',
                    //   onTap: onBtnTap,
                    // ),
                    InkWell(
                      onTap: state.submitLoading
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              // state.createAccount(context);
                              state.onLogin();
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.submitLoading
                              ? primaryColor.withOpacity(0.5)
                              : primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign In',
                                style: kkWhiteBoldTextStyle()
                                    .copyWith(fontSize: 18)),
                            minWidthSpan(),
                            if (state.submitLoading)
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
                      ),
                    ),
                    kSizedBox(),

                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Or',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),

                    LSizedBox(),

                    Container(
                      padding: EdgeInsets.only(right: 50, left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   child: Row(
                          //     children: [
                          //       Image.asset('assets/images/facebook.png'),
                          //       maxWidthSpan(),
                          //       Text(
                          //         'Sign in with Facebook',
                          //         style: kkTextStyle(),
                          //       )
                          //     ],
                          //   ),
                          //   onTap: () {},
                          // ),
                          sSizedBox(),
                          InkWell(
                            child: Row(
                              children: [
                                Image.asset('assets/images/google.png'),
                                maxWidthSpan(),
                                Text(
                                  'Sign in with Google',
                                  style: kkTextStyle(),
                                )
                              ],
                            ),
                            onTap: () {
                              state.signInWithGoogle();
                            },
                          ),
                          sSizedBox(),
                          if (Platform.isIOS)
                            InkWell(
                              child: Row(
                                children: [
                                  Image.asset('assets/images/apple.png'),
                                  maxWidthSpan(),
                                  Text(
                                    'Sign in with Apple',
                                    style: kkTextStyle(),
                                  )
                                ],
                              ),
                              onTap: () {
                                state.signInWithApple();
                              },
                            ),
                        ],
                      ),
                    ),
                    LSizedBox(),

                    InkWell(
                      onTap: () {
                        // navigatorKey.currentState!.pushNamed("/register");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an Account yet ? ',
                            style: kTextStyle().copyWith(color: Colors.grey),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RegisterScreen.id);
                              },
                              child: Text(
                                'Sign Up Here',
                                style: kTextStyle().copyWith(
                                    color: primaryColor,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
