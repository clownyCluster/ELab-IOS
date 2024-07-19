import 'package:elab/constant/constant.dart';
import 'package:flutter/material.dart';

import '../OrdersHistoryDetailsModule/order_details_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  static const String id = "UploadScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: kStandardPadding(),
          child: Column(
            children: [
              ListTiles(),
              kSizedBox(),
              ListTiles(),
              kSizedBox(),
              ListTiles(),
              kSizedBox(),
              ListTiles(),
              kSizedBox(),
              ListTiles(),
              kSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding(),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 196, 196, 196),
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 1.3, //extend the shadow
            offset: Offset(
              2.0,
              2,
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#001-24445-S',
            style: kkBoldTextStyle(),
          ),
          sSizedBox(),
          Row(
            children: [
              Text(
                'Order Date : ',
                style: kBoldTextStyle(),
              ),
              Text(
                '10-20-2022',
                style: kkBoldTextStyle().copyWith(fontSize: 14),
              ),
            ],
          ),
          sSizedBox(),
          Row(
            children: [
              Text(
                'Smart Report :  ',
                style: kBoldTextStyle(),
              ),
              Text(
                'Check Up package',
                style: kkBoldTextStyle().copyWith(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Receipt : ',
                    style: kBoldTextStyle(),
                  ),
                  Text(
                    'Delivered',
                    style: kkBoldTextStyle().copyWith(fontSize: 14),
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  padding: kPadding(),
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1, color: Colors.grey),
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 231, 231, 231),
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          2.0, // Move to right 5  horizontally
                          2.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Text('View Details',
                      style: kWhiteBoldTextStyle().copyWith(fontSize: 12)),
                ),
                onTap: () {
                  Navigator.pushNamed(context, OrderDetailsScreen.id);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
