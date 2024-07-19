import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant/constant.dart';

class PageLoading extends StatelessWidget {
  String? title;
  PageLoading({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Padding(
            padding: kHorizontalPadding(),
            child: Icon(
              Icons.filter_alt_outlined,
              size: 30,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // padding: kStandardPadding(),
            alignment: Alignment.center,
            color: Colors.white,
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
        ),
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: const Color.fromARGB(255, 219, 219, 219),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Expanded(
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //             isDense: true,
              //             hintText: 'Search Package',
              //             prefixIcon: Icon(Icons.search),
              //             focusColor: primaryColor,
              //             hintStyle: kkTextStyle(),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(
              //                 10,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       maxWidthSpan(),
              //     ],
              //   ),
              // ),
              kSizedBox(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
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
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
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
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
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
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
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
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
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
                    height: 150.0,
                  ),
                  maxWidthSpan(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.43609,
                    height: 150.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
