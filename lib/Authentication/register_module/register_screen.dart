import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constant/constant.dart';
import '../../../../../constant/helper.dart';
import '../../main.dart';
import '../../screen/HomeModule/home_display.dart';
import '../login_module/login_screen.dart';
import 'register_state.dart';
// ignore: depend_on_referenced_packages

class RegisterScreen extends StatelessWidget {
  static const String id = 'RegisterScreen';
  final formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterState>(context);
    googleLogIn(){
      
    }
    faceBookLogin() {}

    appleLogin() async {}
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
                key: formKey,
                child: ListView(
                  children: [
                    LSizedBox(),
                    Image.asset(
                      'assets/images/man.png',
                      height: 170,
                    ),
                    LSizedBox(),
                    Center(
                        child: Text(
                      'Sign Up',
                      style: kkBoldTextStyle().copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700]),
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

                    Text('Name', style: kBoldTextStyle()),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onNameChanged,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: primaryColor,
                        ),
                        hintText: 'Enter Your Full Name',
                        hintStyle: kTextStyle().copyWith(color: Colors.grey),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name is required!";
                        }
                        return null;
                      },
                    ),
                    kSizedBox(),
                    Text(
                      'Email Address',
                      style: kBoldTextStyle(),
                    ),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onEmailChanged,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: primaryColor,
                        ),
                        isDense: true,
                        hintText: 'Enter Your Email',
                        hintStyle: kTextStyle().copyWith(color: Colors.grey),
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

                    kSizedBox(),
                    Text('Phone Number', style: kBoldTextStyle()),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onNumberChanged,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_android_rounded,
                          color: primaryColor,
                        ),
                        isDense: true,
                        hintText: 'Enter Your Phone Number',
                        hintStyle: kTextStyle().copyWith(color: Colors.grey),
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
                          return "Phone No is required!";
                        } else if (!mail.hasMatch(value)) {
                          return "Please provide valid Mobile No!";
                        }
                        return null;
                      },
                    ),
                    kSizedBox(),
                    // TextFormField(
                    //   onChanged: state.onAddressChanged,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.location_on_outlined,
                    //       color: primaryColor,
                    //     ),
                    //     isDense: true,
                    //     hintText: 'Address',
                    //     hintStyle: kTextStyle().copyWith(color: Colors.grey),
                    //     filled: true,
                    //     fillColor: Colors.grey.withOpacity(0.1),
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide.none),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: primaryColor),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     RegExp mail = RegExp(
                    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                    //     if (value == null || value.isEmpty) {
                    //       return "Address is required!";
                    //     } else if (!mail.hasMatch(value)) {
                    //       return "Please provide valid Address!";
                    //     }
                    //     return null;
                    //   },
                    // ),
                    Text('Password', style: kBoldTextStyle()),
                    sSizedBox(),
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
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                        ),
                        hintText: 'Enter Your Password',
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
                        RegExp upperCase = RegExp(r'(?=.*?[A-Z])');
                        RegExp lowerCase = RegExp(r'(?=.*?[a-z])');
                        RegExp number = RegExp(r'(?=.*?[0-9])');
                        RegExp special = RegExp(r'^[a-zA-Z0-9]+$');
                        if (value == null || value.isEmpty) {
                          return "password is required!";
                        } else if (!upperCase.hasMatch(value)) {
                          return "Please use at least one Upper case letter!";
                        } else if (!lowerCase.hasMatch(value)) {
                          return "Please use at least one Lower case letter!";
                        } else if (!number.hasMatch(value)) {
                          return "Please use at least one number!";
                        } else if (special.hasMatch(value)) {
                          return "Please use at least one special character!";
                        }
                        return null;
                      },
                    ),
                    kSizedBox(),
                    Text('Confirm Password', style: kBoldTextStyle()),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onConfirmPasswordChanged,
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
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: kTextStyle().copyWith(color: Colors.grey),
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // validator: (value) {
                      // RegExp upperCase = RegExp(r'(?=.*?[A-Z])');
                      // RegExp lowerCase = RegExp(r'(?=.*?[a-z])');
                      // RegExp number = RegExp(r'(?=.*?[0-9])');
                      // RegExp special = RegExp(r'^[a-zA-Z0-9]+$');
                      // if (value == null || value.isEmpty) {
                      //   return "ConfirmPassword is required!";
                      // } else if (!upperCase.hasMatch(value)) {
                      //   return "Please use at least one Upper case letter!";
                      // } else if (!lowerCase.hasMatch(value)) {
                      //   return "Please use at least one Lower case letter!";
                      // } else if (!number.hasMatch(value)) {
                      //   return "Please use at least one number!";
                      // } else if (special.hasMatch(value)) {
                      //   return "Please use at least one special character!";
                      // }
                      // return null;
                      // },
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    // ),
                    kSizedBox(),
                    InkWell(
                      onTap: state.isLoading
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();
                              state.onRegister();
                              // Navigator.pushNamed(context, HomeDisplay.id);
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign Up',
                                style: kkWhiteBoldTextStyle()
                                    .copyWith(fontSize: 18)),
                            minWidthSpan(),
                            if (state.isLoading)
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
                    LSizedBox(),
                    // kSizedBox(),
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
                        )),
                      ],
                    ),

                    kSizedBox(),

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
                          //         'sign in with Facebook',
                          //         style: kkTextStyle(),
                          //       )
                          //     ],
                          //   ),
                          //   onTap: () {},
                          // ),
                          sSizedBox(),
                          // InkWell(
                          //   child: Row(
                          //     children: [
                          //       Image.asset('assets/images/google.png'),
                          //       maxWidthSpan(),
                          //       Text(
                          //         'sign in with Google',
                          //         style: kkTextStyle(),
                          //       )
                          //     ],
                          //   ),
                          //   onTap: () {},
                          // ),
                          // sSizedBox(),
                          // InkWell(
                          //   child: Row(
                          //     children: [
                          //       Image.asset('assets/images/apple.png'),
                          //       maxWidthSpan(),
                          //       Text(
                          //         'sign in with Apple',
                          //         style: kkTextStyle(),
                          //       )
                          //     ],
                          //   ),
                          //   onTap: () {},
                          // ),
                        ],
                      ),
                    ),
                    LSizedBox(),
                    Center(
                      child: InkWell(
                        onTap: () {
                          navigatorKey.currentState!.pushNamed("/login");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account? ',
                              style: kTextStyle(),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                                print('login');
                              },
                              child: Text(
                                'Sign In Here',
                                style: kTextStyle().copyWith(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
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
