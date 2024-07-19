import 'package:elab/constant/constant.dart';
import 'package:elab/pages/UpdatePassword/update_password_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/local_storage_service.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});
  static const String id = "UpdatePasswordScreen";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UpdatePasswordState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Password'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: kStandardPadding(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your Old  Password',
                      style: kBoldTextStyle(),
                    ),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onOldPasswordChange,
                      obscureText: state.isPasswordVisible,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(
                        //   Icons.lock_outline,
                        //   color: primaryColor,
                        // ),
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
                        hintText: 'Enter you Old Password',
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
                    kSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password ?',
                          style: kTextStyle().copyWith(color: Colors.red[600]),
                        ),
                      ],
                    ),
                    kSizedBox(),
                    Text('Enter Your New Password', style: kBoldTextStyle()),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onPasswordChange,
                      obscureText: state.isPasswordVisible,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(
                        //   Icons.lock_outline,
                        //   color: primaryColor,
                        // ),
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
                        hintText: 'Enter you New Password',
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
                    kSizedBox(),
                    Text('Confirm Your New Password', style: kBoldTextStyle()),
                    sSizedBox(),
                    TextFormField(
                      onChanged: state.onConfirmPassword,
                      obscureText: state.isPasswordVisible,
                      decoration: InputDecoration(
                        // prefixIcon: Icon(
                        //   // Icons.lock_outline,
                        //   // color: primaryColor,
                        // ),
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
                        hintText: 'Confirm Your New Password',
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
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: kPadding(),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: kPadding(),
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1,color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red[700],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cancel',
                          style: kWhiteBoldTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                maxWidthSpan(),
                InkWell(
                    child: state.isLoading == true
                        ? Center(
                            child:
                                CircularProgressIndicator(color: primaryColor),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            padding: kPadding(),
                            decoration: BoxDecoration(
                              // border: Border.all(width: 1,color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Save Changes',
                                    style: kWhiteBoldTextStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    onTap: () {
                      state.onChangePassword();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
