import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant/constant.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.grey),
        leading: Image.asset(
          'assets/images/menu.png',
          // color: Colors.grey[500],
        ),
        actions: [
          Image.asset(
            'assets/images/location-icon.png',
            // color: Colors.grey[500],
          )
        ],

        title: Container(
          height: 55,
          // padding: kStandardPadding(),
          alignment: Alignment.center,

          color: const Color.fromARGB(255, 241, 241, 241),
          child: TextFormField(
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                hintText: "Search",
                fillColor: whiteColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 201, 190, 190)),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        //  Container(
        //   width: 130,
        //   height: 30,
        //   // color: Colors.grey[500],
        //   child: Image.asset('assets/images/logo.png'),

        // ),
        // centerTitle: false,
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(40.0),
        //   child: Container(
        //     height: 55,
        //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        //     // padding: kStandardPadding(),
        //     alignment: Alignment.center,
        //     color: const Color.fromARGB(255, 241, 241, 241),
        //     child: TextFormField(
        //       decoration: InputDecoration(
        //           isDense: true,
        //           prefixIcon: Icon(
        //             Icons.search,
        //             color: primaryColor,
        //           ),
        //           hintText: "Search",
        //           fillColor: whiteColor,
        //           filled: true,
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(10),
        //               borderSide: BorderSide(color: primaryColor)),
        //           enabledBorder: OutlineInputBorder(
        //               borderSide:
        //                   BorderSide(color: Color.fromARGB(255, 201, 190, 190)),
        //               borderRadius: BorderRadius.circular(10))),
        //     ),
        //   ),
        // ),
        elevation: 0,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: const Color.fromARGB(255, 219, 219, 219),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.434,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.434,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              LSizedBox(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 50.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 50.0,
                  ),
                ],
              ),
              kSizedBox(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 50.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 50.0,
                  ),
                ],
              ),
              kSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 20.0,
                  ),
                ],
              ),
              kSizedBox(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150.0,
                    ),
                    maxWidthSpan(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150.0,
                    ),
                    maxWidthSpan(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150.0,
                    ),
                  ],
                ),
              ),
              kSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 20.0,
                  ),
                ],
              ),
              kSizedBox(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150.0,
                    ),
                    maxWidthSpan(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150.0,
                    ),
                    maxWidthSpan(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 150.0,
                    ),
                  ],
                ),
              ),
              LSizedBox(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 150.0,
                  ),
                ],
              ),
              kSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
