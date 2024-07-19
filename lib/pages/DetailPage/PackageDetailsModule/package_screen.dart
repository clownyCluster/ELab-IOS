import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/main.dart';
import 'package:elab/pages/CheckoutModule/checkout_screen.dart';
import 'package:elab/pages/DetailPage/PackageDetailsModule/package_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});
  static const String id = 'PackageScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PackageState>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(state.title.toString()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: kStandardPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            child: Image.network(
                              state.packageModelResponse!.data!.icon!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Container(
                          //   padding: kPadding(),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Colors.white,
                          //     boxShadow: [
                          //       BoxShadow(
                          //         color:
                          //             const Color.fromARGB(255, 196, 196, 196),
                          //         blurRadius: 2.0, // soften the shadow
                          //         spreadRadius: 1.3, //extend the shadow
                          //         offset: Offset(
                          //           2.0,
                          //           2,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          //   child: Table(
                          //     border: TableBorder.all(),
                          //     children: [
                          //       TableRow(
                          //         children: [
                          //           TableCell(
                          //             child: Container(
                          //               child: Column(
                          //                 children: state
                          //                     .conditionsModelResponse!.data!
                          //                     .map((e) {
                          //                   return Container(
                          //                     padding: sPadding,
                          //                     width: double.infinity,
                          //                     decoration: BoxDecoration(
                          //                       border: Border.symmetric(
                          //                           horizontal:
                          //                               BorderSide(width: 1)),
                          //                     ),
                          //                     child: Column(
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.start,
                          //                       children: [
                          //                         Text(e.name!),
                          //                       ],
                          //                     ),
                          //                   );
                          //                 }).toList(),
                          //               ),
                          //             ),
                          //           ),
                          //           TableCell(
                          //             child: Container(
                          //               child: Column(
                          //                 children: state
                          //                     .conditionsModelResponse!.data!
                          //                     .map((e) {
                          //                   return Container(
                          //                     padding: sPadding,
                          //                     width: double.infinity,
                          //                     decoration: BoxDecoration(
                          //                         border: Border.symmetric(
                          //                             horizontal: BorderSide(
                          //                                 width: 1))),
                          //                     child: Column(
                          //                       children: [
                          //                         Row(
                          //                           children: [
                          //                             Expanded(
                          //                               child: Text(
                          //                                 e.name!,
                          //                                 overflow: TextOverflow
                          //                                     .ellipsis,
                          //                                 maxLines: 1,
                          //                               ),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   );
                          //                 }).toList(),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          LSizedBox(),
                          Container(
                            padding: kPadding(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 196, 196, 196),
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
                                  // state.packageModelResponse!.data!.
                                  'Ideal for people who are getting their health checkup for the first time',
                                  style: kTextStyle(),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Text(
                                  'Category',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  state.packageModelResponse!.data!.name!,
                                  // 'Preventive Care Packages',
                                  style: kTextStyle(),
                                ),
                                kSizedBox(),
                                Text(
                                  'Report Delivery',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  state.packageModelResponse!.data!
                                      .reportDelivery!,
                                  // 'CBC- Daily 17:30 Daily (Mon to Sat) ,TSH: 19:00 with same day, Other tests: 18:00 hrs with same day reporting.',
                                  style: kTextStyle(),
                                ),
                                kSizedBox(),
                                Text(
                                  'Pre-test Information',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  state.packageModelResponse!.data!
                                      .preTestInformation!,

                                  // '10-12 hours fasting ( Over night Fasting). Patient can drink water during fasting period. Intake of caloric food, coffee, diet soda/gum strictly not allowed during fasting period. For Urine routine analysis (Fasting & Random) Urine specimen must preferably be first voided midstream morning urine, must be collected in the sterile plastic container provided by SRL. Do not accept out side container ( other than SRL). Provide medication & clinical details .',
                                  style: kTextStyle(),
                                ),
                                kSizedBox(),
                                Text(
                                  'Who should book this test',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  state.packageModelResponse!.data!
                                      .whoShouldBook!,
                                  style: kTextStyle(),
                                )
                              ],
                            ),
                          ),
                          LSizedBox(),

                          Column(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.packageModelResponse!.data!
                                      .testsAndParameters!
                                      .asMap()
                                      .entries
                                      .where((entry) => state.showMore == true
                                          ? entry.key <
                                              state.packageModelResponse!.data!
                                                  .testsAndParameters!.length
                                          : entry.key < 5)
                                      .map((entry) {
                                    final index = entry.key;
                                    final e = entry.value;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                          ),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  state.onExpandedChange(index);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        e.test!,
                                                        style:
                                                            kWhiteBoldTextStyle(),
                                                      ),
                                                      state.selectedExpandedIndex ==
                                                              index
                                                          ? Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 16,
                                                            )
                                                          : Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color:
                                                                  Colors.white,
                                                              size: 16,
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (state.selectedExpandedIndex ==
                                                  index)
                                                Column(
                                                  children:
                                                      e.parmeters!.map((data) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              data,
                                                              style:
                                                                  kTextStyle()
                                                                      .copyWith(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                            ],
                                          ),
                                        ),
                                        sSizedBox(),
                                      ],
                                    );
                                  }).toList()),
                            ],
                          ),
                          state.packageModelResponse!.data!
                                          .testsAndParameters ==
                                      null ||
                                  state.packageModelResponse!.data!
                                      .testsAndParameters!.isEmpty
                              ? Container()
                              // ? Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       InkWell(
                              //           onTap: () {
                              //             state.onShowmore();
                              //           },
                              //           child: Row(
                              //             children: [
                              //               state.showMore == true
                              //                   ? Row(
                              //                       children: [
                              //                         Text(
                              //                           'Show Less',
                              //                           style: kkBoldTextStyle()
                              //                               .copyWith(
                              //                                   fontSize: 14),
                              //                         ),
                              //                         maxWidthSpan(),
                              //                         Icon(Icons.arrow_forward)
                              //                       ],
                              //                     )
                              //                   : Row(
                              //                       children: [
                              //                         Text('Show More',
                              //                             style:
                              //                                 kkBoldTextStyle()
                              //                                     .copyWith(
                              //                                         fontSize:
                              //                                             14)),
                              //                         maxWidthSpan(),
                              //                         Icon(Icons.arrow_forward)
                              //                       ],
                              //                     )
                              //             ],
                              //           )),
                              //     ],
                              //   )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          state.onShowmore();
                                        },
                                        child: Row(
                                          children: [
                                            state.showMore == true
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        'Show Less',
                                                        style: kkBoldTextStyle()
                                                            .copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      maxWidthSpan(),
                                                      Icon(Icons.arrow_forward)
                                                    ],
                                                  )
                                                : Row(
                                                    children: [
                                                      Text('Show More',
                                                          style:
                                                              kkBoldTextStyle()
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14)),
                                                      maxWidthSpan(),
                                                      Icon(Icons.arrow_forward)
                                                    ],
                                                  )
                                          ],
                                        )),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: kPadding(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    // border: Border.all(width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL PAYABLE',
                            style: kkBoldTextStyle().copyWith(fontSize: 13),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rs. ${state.packageModelResponse!.data!.discountedPrice}',
                                style: kkBoldTextStyle().copyWith(fontSize: 15),
                              ),
                              maxWidthSpan(),
                              Text(
                                'Rs.${state.packageModelResponse!.data!.price!}',
                                style: kUnderline(),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              width: 180,
                              padding: sPadding,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),
                              // height: 20,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  maxWidthSpan(),
                                  Text(
                                    'Add To cart',
                                    style: kWhiteBoldTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              if (state.token == null) {
                                navigatorKey.currentState!
                                    .pushNamedAndRemoveUntil(
                                        LoginScreen.id, (route) => false);
                              } else {
                                state.postCart();
                              }
                            },
                          ),
                          sSizedBox(),
                          InkWell(
                            child: Container(
                              width: 180,
                              padding: sPadding,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor,
                              ),
                              // height: 20,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Book This Package',
                                    style: kWhiteBoldTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              if (state.token == null) {
                                navigatorKey.currentState!
                                    .pushNamedAndRemoveUntil(
                                        LoginScreen.id, (route) => false);
                              } else {
                                state.postCart();
                                navigatorKey.currentState!
                                    .pushNamed(CheckoutScreen.id);
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
