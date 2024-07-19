import 'package:elab/constant/constant.dart';
import 'package:elab/main.dart';
import 'package:elab/pages/ShippingAddressModule/shipping_address_screen.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});
  static const String id = "AddressScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Address Information'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: kStandardPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.43,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Primary Address",
                            style: kWhiteBoldTextStyle(),
                          ),
                        ),
                      ),
                      maxWidthSpan(),
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
                            "Shipping Address",
                            style: kWhiteBoldTextStyle()
                                .copyWith(color: Colors.black),
                          )),
                        ),
                        onTap: () {
                          Navigator.popAndPushNamed(
                              context, ShippingAddressScreen.id);
                        },
                      ),
                    ],
                  ),
                  LSizedBox(),
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
                      hintStyle: kTextStyle().copyWith(color: Colors.grey[400]),
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
                      hintStyle: kTextStyle().copyWith(color: Colors.grey[400]),
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
                      hintStyle: kTextStyle().copyWith(color: Colors.grey[400]),
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
                      hintStyle: kTextStyle().copyWith(color: Colors.grey[400]),
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
