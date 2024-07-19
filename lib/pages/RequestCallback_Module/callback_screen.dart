import 'package:elab/constant/constant.dart';
import 'package:elab/constant/k_text_field.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/RequestCallback_Module/callback_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../NoInternet/no_internet_screen.dart';

class RequestCallBackScreen extends StatelessWidget {
  const RequestCallBackScreen({super.key});
  static const String id = 'RequestCallBackScreen';
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RequestCallBackState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Request A Callback'),
        backgroundColor: primaryColor,
      ),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: kStandardPadding(),
                          child: Column(
                            children: [
                              Container(
                                padding: sPadding,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 196, 196, 196),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.3, //extend the shadow
                                      offset: Offset(
                                        2.0, // Move to right 5  horizontally
                                        2.0, // Move to bottom 5 Vertically
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Please fill in the form below with your correct information. We will call you back within 24 hrs.',
                                      style: kkBoldTextStyle()
                                          .copyWith(color: Colors.black),
                                    ),
                                    LSizedBox(),
                                    Text(
                                      'Full Name',
                                      style: kkBoldTextStyle().copyWith(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                    sSizedBox(),
                                    TextFormField(
                                      onChanged: state.onFullNameChanged,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: primaryColor,
                                        ),
                                        isDense: true,
                                        hintText: 'Full Name',
                                        // labelText: 'Enter your Email Address',
                                        hintStyle: kTextStyle()
                                            .copyWith(color: Colors.grey[500]),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    kSizedBox(),
                                    Text(
                                      'Phone Number',
                                      style: kkBoldTextStyle().copyWith(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                    sSizedBox(),
                                    TextFormField(
                                      onChanged: state.onPhoneNumberChange,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: primaryColor,
                                        ),
                                        isDense: true,
                                        hintText: 'Phone Number',
                                        // labelText: 'Enter your Email Address',
                                        hintStyle: kTextStyle()
                                            .copyWith(color: Colors.grey[500]),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    kSizedBox(),
                                    Text(
                                      'Email',
                                      style: kkBoldTextStyle().copyWith(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                    sSizedBox(),
                                    TextFormField(
                                      onChanged: state.onEmailChanged,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: primaryColor,
                                        ),
                                        isDense: true,
                                        hintText: 'Email',
                                        // labelText: 'Enter your Email Address',
                                        hintStyle: kTextStyle()
                                            .copyWith(color: Colors.grey[500]),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    kSizedBox(),
                                    Text(
                                      'Callback Subject',
                                      style: kkBoldTextStyle().copyWith(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                    sSizedBox(),
                                    TextFormField(
                                      onChanged: state.onCallbackChanged,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone_callback,
                                          color: primaryColor,
                                        ),
                                        isDense: true,
                                        hintText: 'Enter your Callback Subject',
                                        // labelText: 'Enter your Email Address',
                                        hintStyle: kTextStyle()
                                            .copyWith(color: Colors.grey[500]),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    kSizedBox(),
                                    Text(
                                      'Add you comment',
                                      style: kkBoldTextStyle().copyWith(
                                          color: primaryColor, fontSize: 14),
                                    ),
                                    sSizedBox(),
                                    TextFormField(
                                      onChanged: state.onCommentChanged,
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                        // prefixIcon: Icon(
                                        //   Icons.comment,
                                        //   color: primaryColor,
                                        // ),
                                        isDense: true,
                                        hintText: 'Type you comment',
                                        // labelText: 'Enter your Email Address',

                                        hintStyle: kTextStyle()
                                            .copyWith(color: Colors.grey[500]),
                                        filled: true,
                                        fillColor: Colors.grey.withOpacity(0.1),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                              width: 120,
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
                              child: Container(
                                width: 140,
                                padding: kPadding(),
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1,color: Colors.red),
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Submit Request',
                                      style: kWhiteBoldTextStyle(),
                                    ),
                                    maxWidthSpan(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                state.onCallPost();
                              })
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
