import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/Payment_for_self/payment_for_self_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../service/toast_service.dart';
import '../NoInternet/no_internet_screen.dart';
import '../PaymentOptionsModule/payment_options_screen.dart';

// GlobalKey<FormState> formKey = GlobalKey<FormState>();

class PaymentForMySelfScreen extends StatelessWidget {
  const PaymentForMySelfScreen({super.key});
  static const String id = "PaymentForMySelfScreen";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<PaymentForMySelfState>(context);
    return Scaffold(
      appBar: defaultAppBar('Payment Method'),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/check.png',
                                      ),
                                      minWidthSpan(),
                                      Text('My Cart', style: kBoldTextStyle())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/checkbox.png'),
                                      minWidthSpan(),
                                      Text(
                                        'Check Out',
                                        style: kBoldTextStyle()
                                            .copyWith(color: secondaryColor),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/checkboxoutline.png'),
                                      minWidthSpan(),
                                      Text(
                                        'Confirmation',
                                        style: kBoldTextStyle(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              kSizedBox(),
                              Divider(
                                height: 1,
                                color: Colors.grey[500],
                              ),
                              kSizedBox(),
                              Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1, color: Colors.white),
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 167, 167, 167),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.3, //extend the shadow
                                      offset: Offset(
                                        2.0,
                                        2,
                                      ),
                                    )
                                  ],
                                ),
                                padding: kPadding(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Payment Options',
                                      style: kkBoldTextStyle(),
                                    ),
                                    kSizedBox(),
                                    Divider(
                                      height: 1,
                                      color: Colors.grey[500],
                                    ),
                                    kSizedBox(),

                                    Table(
                                      border: TableBorder.all(
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          width: 1.3,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      children: [
                                        TableRow(children: [
                                          Padding(
                                            padding: tPadding,
                                            child: Text(
                                              'Sub-Total ',
                                              style: kkBoldTextStyle().copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          // maxWidthSpan(),
                                          Padding(
                                            padding: tPadding,
                                            child: Text(
                                              ' Rs.${state.cartListResponse!.totalPrice!}',
                                              style: kkBoldTextStyle().copyWith(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: tPadding,
                                            child: Text(
                                              'Discount  ',
                                              style: kkBoldTextStyle().copyWith(
                                                fontSize: 13,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          // maxWidthSpan(),
                                          Padding(
                                            padding: tPadding,
                                            child: Text(
                                              '-Rs.${state.cartListResponse!.couponPrice}',
                                              style: kkBoldTextStyle().copyWith(
                                                fontSize: 13,
                                                color: Colors.red,
                                              ),
                                            ),
                                          )
                                        ]),
                                        TableRow(children: [
                                          Padding(
                                            padding: tPadding,
                                            child: Text(
                                              'Total  ',
                                              style: kkBoldTextStyle().copyWith(
                                                fontSize: 13,
                                                // color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          // maxWidthSpan(),
                                          Padding(
                                            padding: tPadding,
                                            child: Text(
                                              ' Rs.${state.cartListResponse!.totalPrice!}',
                                              style: kkBoldTextStyle().copyWith(
                                                fontSize: 14,
                                                // color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ])
                                      ],
                                    ),

                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       'Sub-Total : ',
                                    //       style: kBoldTextStyle(),
                                    //     ),
                                    //     maxWidthSpan(),
                                    //     Text(
                                    //       'Rs.${state.cartListResponse!.totalPrice}',
                                    //       style: kkBoldTextStyle().copyWith(
                                    //         fontSize: 13,
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // sSizedBox(),
                                    // Row(
                                    //   children: [
                                    //     Text('Discount : ',
                                    //         style: kBoldTextStyle()),
                                    //     maxWidthSpan(),
                                    //     Text(
                                    //       'Rs.${state.cartListResponse!.couponPrice}',
                                    //       style: kkBoldTextStyle().copyWith(
                                    //         fontSize: 13,
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // sSizedBox(),
                                    // Row(
                                    //   children: [
                                    //     Text('Total :  ',
                                    //         style: kBoldTextStyle()),
                                    //     maxWidthSpan(),
                                    //     Text(
                                    //       'Rs.${state.cartListResponse!.totalPrice}',
                                    //       style: kkBoldTextStyle().copyWith(
                                    //         fontSize: 13,
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    sSizedBox(),
                                    Divider(
                                      // height: 2,
                                      color: Colors.grey[100],
                                      thickness: 2,
                                    ),
                                    Text(
                                      'Apply Discount Code if Available : ',
                                      style: kTextStyle(),
                                    ),
                                    kSizedBox(),
                                    // Row(
                                    //   children: [
                                    // Container(
                                    //   // width: double.infinity,
                                    //   height: 40,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         width: 1, color: primaryColor),
                                    //     borderRadius: BorderRadius.circular(11),
                                    //     color: Colors.grey[100],
                                    //   ),
                                    //   child: TextField(
                                    //     decoration: InputDecoration(
                                    //       isDense: true,
                                    //       hintText: 'Apply Code',
                                    //       hintStyle: kTextStyle()
                                    //           .copyWith(color: Colors.grey[500]),
                                    //       filled: true,
                                    //       focusColor: primaryColor,
                                    //       fillColor: Colors.grey.withOpacity(0.1),
                                    //       border: OutlineInputBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(10),
                                    //           borderSide: BorderSide.none),
                                    //       focusedBorder: OutlineInputBorder(
                                    //         borderSide:
                                    //             BorderSide(color: primaryColor),
                                    //         borderRadius: BorderRadius.circular(10),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    //   ],
                                    // ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 45,
                                          child: TextFormField(
                                            controller: state.couponeController,
                                            // onChanged: state.onCouponCode,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: primaryColor,
                                                ),
                                                hintText: "Apply Code",
                                                fillColor: whiteColor,
                                                filled: true,
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    borderSide: BorderSide(
                                                        color: primaryColor)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    201,
                                                                    190,
                                                                    190)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10))),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (state.couponeController.text
                                                .isEmpty) {
                                              ToastService()
                                                  .e('Coupone Can\'t be null');
                                            } else {
                                              state.postDiscount();
                                            }
                                          },
                                          child: Container(
                                            padding: kStandardPadding(),
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              'Apply',
                                              style: kWhiteBoldTextStyle(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    kSizedBox(),
                                    Row(
                                      children: [
                                        Text(
                                          'Code Discount : ',
                                          style: kTextStyle(),
                                        ),
                                        Text(
                                          ' - Rs.${state.cartListResponse!.couponPrice}',
                                          style: kTextStyle(),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey[100],
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Grand Total :',
                                          style: kkBoldTextStyle(),
                                        ),
                                        maxWidthSpan(),
                                        Text(
                                          'Rs.${state.cartListResponse!.totalPrice}',
                                          style: kkBoldTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              LSizedBox(),
                              Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1, color: Colors.white),
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 167, 167, 167),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.3, //extend the shadow
                                      offset: Offset(
                                        2.0,
                                        2,
                                      ),
                                    )
                                  ],
                                ),
                                padding: kPadding(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '  Select A Payment Method',
                                      style: kkBoldTextStyle(),
                                    ),
                                    kSizedBox(),
                                    Column(
                                      children: [
                                        RadioListTile(
                                          visualDensity: VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          activeColor: primaryColor,
                                          dense: true,
                                          title: Text("Cash On Delivery"),
                                          value: "Cash On Delivery",
                                          groupValue: state.Payment,
                                          onChanged: (value) {
                                            state.onPaymentChange(value);
                                          },
                                        ),
                                        RadioListTile(
                                          visualDensity: VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          activeColor: primaryColor,
                                          dense: true,
                                          title: Text("Pay using E-Sewa "),
                                          value: "E-Sewa ",
                                          groupValue: state.Payment,
                                          onChanged: (value) {
                                            state.onPaymentChange(value);
                                          },
                                        ),
                                        RadioListTile(
                                          visualDensity: VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          dense: true,
                                          activeColor: primaryColor,
                                          title: Text("Pay using Khalti"),
                                          value: "Khalti",
                                          groupValue: state.Payment,
                                          onChanged: (value) {
                                            state.onPaymentChange(value);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              LSizedBox(),
                              Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1, color: Colors.white),
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 167, 167, 167),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.3, //extend the shadow
                                      offset: Offset(
                                        2.0,
                                        2,
                                      ),
                                    )
                                  ],
                                ),
                                padding: kPadding(),
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Cart Summary',
                                              style: kkBoldTextStyle()),
                                          state.isCartExpanded == true
                                              ? Image.asset(
                                                  'assets/images/down.png',
                                                  height: 15,
                                                  scale: 0.7,
                                                  color: Colors.black,
                                                )
                                              : Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15,
                                                ),
                                        ],
                                      ),
                                      sSizedBox(),
                                      state.isCartExpanded == true
                                          ? Column(
                                              children: [
                                                Column(
                                                    children: state
                                                        .cartListResponse!.data!
                                                        .map((e) =>
                                                            CartListTile(
                                                              name: e.slug,
                                                              price: e.price,
                                                              totlePrice:
                                                                  e.price,
                                                              quantity:
                                                                  e.quantity,
                                                            ))
                                                        .toList()
                                                    // CartListTile()

                                                    ),

                                                // sSizedBox(),
                                                // Container(
                                                //   padding: sPadding,
                                                //   decoration: BoxDecoration(
                                                //       color: Colors.white,
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               10)),
                                                //   child: Column(
                                                //     crossAxisAlignment:
                                                //         CrossAxisAlignment.start,
                                                //     children: [
                                                //       Text(
                                                //         "Kidney Care - Complete",
                                                //         style: kBoldTextStyle(),
                                                //       ),
                                                //       Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Text(
                                                //             'Rs. 5,500  x 3',
                                                //             style: kBoldTextStyle(),
                                                //           ),
                                                //           Text('Rs. 16,500',
                                                //               style:
                                                //                   kkBoldTextStyle())
                                                //         ],
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
                                                sSizedBox(),
                                                // Container(
                                                //   padding: sPadding,
                                                //   decoration: BoxDecoration(
                                                //       color: Colors.white,
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               10)),
                                                //   child: Column(
                                                //     crossAxisAlignment:
                                                //         CrossAxisAlignment.start,
                                                //     children: [
                                                //       Text(
                                                //         "Kidney Care - Complete",
                                                //         style: kBoldTextStyle(),
                                                //       ),
                                                //       Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Text(
                                                //             'Rs. 5,500  x 3',
                                                //             style: kBoldTextStyle(),
                                                //           ),
                                                //           Text('Rs. 16,500',
                                                //               style:
                                                //                   kkBoldTextStyle())
                                                //         ],
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
                                              ],
                                            )
                                          : Container(
                                              padding: EdgeInsets.all(0),
                                            ),
                                    ],
                                  ),
                                  onTap: () {
                                    state.onCartExpandedChanged();
                                    print('tap vayo hai');
                                  },
                                ),
                              ),
                              LSizedBox(),
                              Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1, color: Colors.white),
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 167, 167, 167),
                                      blurRadius: 2.0, // soften the shadow
                                      spreadRadius: 1.3, //extend the shadow
                                      offset: Offset(
                                        2.0,
                                        2,
                                      ),
                                    )
                                  ],
                                ),
                                padding: kPadding(),
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Checkout Summary',
                                            style: kkBoldTextStyle(),
                                          ),
                                          state.isCheckoutExpanded
                                              ? Image.asset(
                                                  'assets/images/down.png',
                                                  scale: 0.8,
                                                  color: Colors.black,
                                                )
                                              : Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15,
                                                ),
                                        ],
                                      ),
                                      sSizedBox(),
                                      state.isCheckoutExpanded == true
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Full Name :',
                                                      style: kBoldTextStyle(),
                                                    ),
                                                    Text(
                                                      // 'John Doe - (Self)',
                                                      state.profileResponse!
                                                          .data!.name!,
                                                      style: kkBoldTextStyle()
                                                          .copyWith(
                                                              fontSize: 13),
                                                    ),
                                                    sSizedBox(),
                                                    Text(
                                                      'Email Address :',
                                                      style: kBoldTextStyle(),
                                                    ),
                                                    SizedBox(
                                                      width: 140,
                                                      child: Text(
                                                        // 'mail@company.com',
                                                        state.profileResponse!
                                                            .data!.email!,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: kkBoldTextStyle()
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                    ),
                                                    sSizedBox(),
                                                    Text(
                                                      'Date of Birth :',
                                                      style: kBoldTextStyle(),
                                                    ),
                                                    Text(
                                                      // '1989 - 04 - 15',
                                                      state.profileResponse!
                                                          .data!.dob
                                                          .toString(),
                                                      style: kkBoldTextStyle()
                                                          .copyWith(
                                                              fontSize: 13),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Phone Number :',
                                                      style: kBoldTextStyle(),
                                                    ),
                                                    Text(
                                                      state.profileResponse!
                                                          .data!.contact
                                                          .toString(),
                                                      style: kkBoldTextStyle()
                                                          .copyWith(
                                                              fontSize: 13),
                                                    ),
                                                    sSizedBox(),
                                                    Text(
                                                      'Gender :',
                                                      style: kBoldTextStyle(),
                                                    ),
                                                    Text(
                                                      // 'Male ',
                                                      state.profileResponse!
                                                          .data!.gender!
                                                          .toString(),
                                                      style: kkBoldTextStyle()
                                                          .copyWith(
                                                              fontSize: 13),
                                                    ),
                                                    sSizedBox(),
                                                    Text(
                                                      'Address :',
                                                      style: kBoldTextStyle(),
                                                    ),
                                                    SizedBox(
                                                      width: 140,
                                                      child: Text(
                                                        // 'GMS Road, KTM',
                                                        state.profileResponse!
                                                            .data!.homeAddress!,
                                                        overflow: TextOverflow
                                                            .ellipsis,

                                                        style: kkBoldTextStyle()
                                                            .copyWith(
                                                                fontSize: 13),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          : Container()
                                    ],
                                  ),
                                  onTap: () {
                                    state.onCheckoutExpandedChanged();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: kStandardPadding(),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 231, 231, 231),
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total payment',
                                style: kBoldTextStyle(),
                              ),
                              sSizedBox(),
                              Text('Rs.${state.cartListResponse!.totalPrice!}',
                                  style: kkBoldTextStyle()),
                            ],
                          ),
                          InkWell(
                              child: Container(
                                width: 200,
                                padding: kPadding(),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  border:
                                      Border.all(width: 1, color: primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Proceed To Payment',
                                      style: kWhiteBoldTextStyle(),
                                    ),
                                    // maxWidthSpan(),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 13,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              onTap: state.Payment == 'Cash On Delivery'
                                  ? () {
                                      state.postOrder(context);
                                    }
                                  : () {
                                      ToastService()
                                          .e('This method is not available');
                                    }),
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}
