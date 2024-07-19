import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/DetailPage/Hemogram_Module/hemogram_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../../screen/HomeModule/home_display.dart';
// import '../../../service/toast_service.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}

class HemogramScreen extends StatelessWidget {
  const HemogramScreen({super.key});
  static const String id = 'HemogramScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HemogramState>(context);
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(state.name.toString()),
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: kStandardPadding(),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.network(
                              state.hemogramTestModelResponse!.data!.thumbnail!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          kSizedBox(),
                          Container(
                            padding: kPadding(),
                            decoration: BoxDecoration(
                              // border: Border.all(width: 1, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 196, 196, 196),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.hemogramTestModelResponse!.data!
                                      .shortContent
                                      .toString(),
                                  style: kTextStyle(),
                                  // 'Complete hemogram is a test that measures the number of RBCs, WBCs and platelets in blood it also measures the rate at which the RBCs sediment, commonly known as the erythrocyte sedimentation rate (ESR).',
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Text(
                                  'Category',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  // 'Hematological Disorders',
                                  state.hemogramTestModelResponse!.data!.name
                                      .toString(),
                                  style: kkTextStyle().copyWith(fontSize: 13),
                                ),
                                kSizedBox(),
                                Text(
                                  'Pre-test Information',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  // 'No special preparation required',
                                  state.hemogramTestModelResponse!.data!
                                      .preTestInformation
                                      .toString(),
                                  // style: kkTextStyle().copyWith(fontSize: 13),
                                ),
                                // kSizedBox(),
                                Text(
                                  'Report Delivery',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  // 'Mon - Sat, Same Day',
                                  state.hemogramTestModelResponse!.data!
                                      .reportDelivery
                                      .toString(),
                                  style: kkTextStyle().copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          kSizedBox(),
                          Container(
                            padding: kStandardPadding(),
                            decoration: BoxDecoration(
                              // border: Border.all(width: 1, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 196, 196, 196),
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
                                  'Test Detail',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                sSizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.circle,
                                    //   size: 10,
                                    //   color: Colors.grey[800],
                                    // ),
                                    minWidthSpan(),
                                    Text(
                                      stripHtmlIfNeeded(
                                        state.hemogramTestModelResponse!.data!
                                            .testDetails!
                                            .replaceAll('\n', '\n'),
                                      ),
                                    ),
                                  ],
                                ),
                                sSizedBox(),
                              ],
                            ),
                          ),
                          kSizedBox(),
                          state.hemogramTestModelResponse!.data!.faqs!.answers == null ||
                                  state.hemogramTestModelResponse!.data!.faqs!
                                          .questions ==
                                      null ||
                                  state.hemogramTestModelResponse!.data!.faqs!
                                          .answers ==
                                      [] ||
                                  state.hemogramTestModelResponse!.data!.faqs!
                                          .questions ==
                                      [] ||
                                  state.hemogramTestModelResponse!.data!.faqs!
                                      .answers!.isEmpty ||
                                  state.hemogramTestModelResponse!.data!.faqs!
                                      .questions!.isEmpty
                              ? Container()
                              : Container(
                                  padding: kStandardPadding(),
                                  decoration: BoxDecoration(
                                    // border: Border.all(width: 1, color: Colors.grey),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 196, 196, 196),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // 'Who should book this checkup ?',
                                        stripHtmlIfNeeded(
                                          state.hemogramTestModelResponse!.data!
                                                      .faqs!.questions ==
                                                  []
                                              ? 'N/A'
                                              : state.hemogramTestModelResponse!
                                                  .data!.faqs!.questions![0]
                                                  .replaceAll('\n', '\n'),
                                        ),

                                        style: kkBoldTextStyle()
                                            .copyWith(fontSize: 13),
                                      ),
                                      Text(
                                        stripHtmlIfNeeded(
                                          state.hemogramTestModelResponse!.data!
                                                      .faqs!.answers ==
                                                  []
                                              ? 'N/A'
                                              : state.hemogramTestModelResponse!
                                                  .data!.faqs!.answers![0]
                                                  .toString()
                                                  .replaceAll('\n', '\n'),
                                        ),
                                        style: kkTextStyle()
                                            .copyWith(fontSize: 13),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        // height: 7,
                                      ),
                                      Text(
                                        'Medical Checkups',
                                        style: kkBoldTextStyle()
                                            .copyWith(fontSize: 13),
                                      ),
                                      Text(
                                        'Hematological Disorders',
                                        style: kkTextStyle()
                                            .copyWith(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                          kSizedBox(),
                          Container(
                            padding: kStandardPadding(),
                            decoration: BoxDecoration(
                              // border: Border.all(width: 1, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 196, 196, 196),
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
                                  'What payment methods are available ?',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                sSizedBox(),
                                Text(
                                  'With any financial product that you buy, it is important that you know you are getting the best advice from a reputable company as often',
                                  style: kkTextStyle().copyWith(fontSize: 13),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Text(
                                  'Which plan is right for me ?',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                sSizedBox(),
                                Text(
                                  'With any financial product that you buy, it is important that you know you are getting the best advice from a reputable company as often',
                                  style: kkTextStyle().copyWith(fontSize: 13),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Text(
                                  'Do I have to commit to a contract ?',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                sSizedBox(),
                                Text(
                                  'With any financial product that you buy, it is important that you know you are getting the best advice from a reputable company as often',
                                  style: kkTextStyle().copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          LSizedBox(),
                          Container(
                            padding: kStandardPadding(),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              // border: Border.all(width: 1, color: Colors.grey),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 196, 196, 196),
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
                                  'Interpretation',
                                  style:
                                      kkBoldTextStyle().copyWith(fontSize: 13),
                                ),
                                Text(
                                  stripHtmlIfNeeded(
                                    state.hemogramTestModelResponse!.data!
                                                .interpretation ==
                                            null
                                        ? 'N/A'
                                        : state.hemogramTestModelResponse!.data!
                                            .interpretation!
                                            .replaceAll('\n', '\n'),
                                  ),
                                ),
                                // 'Complete Hemogram analyses many factor and hence the full Hemogram interpretation is complex. Along with factors analysed in the test, a phycisian will always ask you to do other tests also taking into account patient’s signs and symptoms and medical history to come to conclusion.\n'),
                                sSizedBox(),
                                Text(''),
                                // 'All factors analyzed together are used to diagnose the condition or prevent the onset of any critical condition. Complete hemogram is particularly useful in health monitoring of elderly patients or patients suffering from chronic illness as it detects even slightest of the variations making it a great preventive checkup test')
                              ],
                            ),
                          ),
                          kSizedBox(),
                          // Container(
                          //   padding: kStandardPadding(),
                          //   decoration: BoxDecoration(
                          //     // border: Border.all(width: 1, color: Colors.grey),
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(10),
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
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Download Sample Report',
                          //         style: kkBoldTextStyle(),
                          //       ),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Image.asset(
                          //               'assets/images/sample-report.png'),
                          //           Image.asset(
                          //               'assets/images/sample-report.png'),
                          //         ],
                          //       ),
                          //       kSizedBox(),
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           // border: Border.all(width: 1, color: Colors.grey),
                          //           color: secondaryColor,

                          //           borderRadius: BorderRadius.circular(10),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: const Color.fromARGB(
                          //                   255, 196, 196, 196),
                          //               blurRadius: 2.0, // soften the shadow
                          //               spreadRadius: 1.3, //extend the shadow
                          //               offset: Offset(
                          //                 2.0,
                          //                 2,
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //         height: 50,
                          //         width: double.infinity,
                          //         child: Center(
                          //             child: Text(
                          //           'Download Sample Report',
                          //           style: kWhiteBoldTextStyle(),
                          //         )),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          LSizedBox(),

                          // Container(
                          //   color: const Color.fromARGB(255, 255, 255, 255),
                          //   height: 500,
                          //   width: 400,
                          //   child: GridView.builder(
                          //     itemCount: state.hemogramTestModelResponse!.data!
                          //         .parameters!.length,
                          //     gridDelegate:
                          //         SliverGridDelegateWithMaxCrossAxisExtent(
                          //             maxCrossAxisExtent: 2,
                          //             childAspectRatio: 2,
                          //             crossAxisSpacing: 10,
                          //             mainAxisSpacing: 10),
                          //     itemBuilder: (context, index) {
                          //       return
                          //        Row(
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //          children: [
                          //            Text(
                          //               state.hemogramTestModelResponse!.data!
                          //                   .parameters![index].name!,
                          //               style: kkBoldTextStyle()
                          //                   .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),

                          //       ),
                          //          ],
                          //        );
                          //     },
                          //   ),
                          // )
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
                                'Rs. ${state.hemogramTestModelResponse!.data!.discountedPrice.toString()}',
                                style: kkBoldTextStyle().copyWith(fontSize: 15),
                              ),
                              maxWidthSpan(),
                              Text(
                                'Rs. ${state.hemogramTestModelResponse!.data!.price.toString()}',
                                style: kUnderline().copyWith(fontSize: 13),
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
                                  Navigator.pushNamed(context, LoginScreen.id);
                                } else {
                                  state.postCart(state
                                      .hemogramTestModelResponse!.data!.slug);
                                }
                              }),
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
                                if (state.token != null) {
                                  state.postPackage(state
                                      .hemogramTestModelResponse!.data!.slug);
                                } else {
                                  Navigator.pushNamed(context, LoginScreen.id);
                                }
                              }),
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
