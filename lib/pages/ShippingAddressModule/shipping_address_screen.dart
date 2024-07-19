import 'package:elab/pages/PrimaryAddressModule/address_screen.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});
  static const String id = 'ShippingAddressScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Shipping Information'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:  Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: kStandardPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.43,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Primary Address",
                                style: kWhiteBoldTextStyle()
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.popAndPushNamed(context, AddressScreen.id);
                          },
                        ),
                        maxWidthSpan(),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.43,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("Shipping Address",
                                  style: kWhiteBoldTextStyle())),
                        ),
                      ],
                    ),
                    LSizedBox(),
                    Text(
                      'Full Name',
                      style: kTextStyle().copyWith(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter Full Name',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    kSizedBox(),
                    Text(
                      'Email Address',
                      style: kTextStyle(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter Email Address',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    kSizedBox(),
                    Text(
                      'Phone Number',
                      style: kTextStyle(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter Phone Number',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    kSizedBox(),
                    Text(
                      'DOB',
                      style: kTextStyle(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter DOB',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    // Text(
                    //   'DOB',
                    //   style: kTextStyle(),
                    // ),
                    // sSizedBox(),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     // suffixIcon: Icon(Icons.calendar_month),
                    //     isDense: true,
                    //     hintText: 'Enter DOB',
                    //     hintStyle: kTextStyle().copyWith(color: Colors.grey[400]),
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
                    // ),
                    Text(
                      'State',
                      style: kTextStyle().copyWith(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter State Name',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    kSizedBox(),
                    Text(
                      'City',
                      style: kTextStyle(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter City Name',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    kSizedBox(),
                    Text(
                      'Postal Code',
                      style: kTextStyle(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter Postal Code',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                    ),
                    kSizedBox(),
                    Text(
                      'Full Address',
                      style: kTextStyle(),
                    ),
                    sSizedBox(),
                    TextField(
                      decoration: InputDecoration(
                        // suffixIcon: Icon(Icons.calendar_month),
                        isDense: true,
                        hintText: 'Enter Full Address',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[400]),
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
                Container(
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
                maxWidthSpan(),
                Container(
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
                        'Save Changes',
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
