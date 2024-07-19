import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../constant/ui_helpers.dart';
import '../../pages/OrdersHistoryDetailsModule/order_details_state.dart';
import '../NoInternet/no_internet_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);
  static const String id = "OrderDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OrderDetailsState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Orders Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading
              ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : state.order.isEmpty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/nodata.png',
                            height: 100,
                            width: 200,
                          ),
                          kSizedBox(),
                          Text(
                            'No Data Found !',
                            style: kkBoldTextStyle(),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: kStandardPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 202, 202, 202)),
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 196, 196, 196),
                                  blurRadius: 2.0,
                                  spreadRadius: 2,
                                  offset: Offset(2.0, 2),
                                ),
                              ],
                            ),
                            padding: sPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.order['order_id'],
                                  style: kkBoldTextStyle().copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(state.order['booked_date']),
                              ],
                            ),
                          ),
                          LSizedBox(),
                          Text(
                            'Package Details',
                            style: kkBoldTextStyle().copyWith(
                              fontSize: 14,
                            ),
                          ),
                          LSizedBox(),
                          Row(
                            children: [
                              Container(
                                // width: double.infinity,
                                padding: kPadding(),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 196, 196, 196),
                                      blurRadius: 2.0,
                                      spreadRadius: 1.3,
                                      offset: Offset(2.0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.order['order']['name'][0]
                                          .toString(),
                                      style: kkBoldTextStyle().copyWith(
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      'Rs. ${state.order['order']['price'][0]}',
                                      style: kTextStyle(),
                                    ),
                                    Text(
                                      'Type: Package',
                                      style: kTextStyle(),
                                    ),
                                  ],
                                ),
                              ),

                              // maxWidthSpan(),
                            ],
                          ),

                          // kSizedBox(),
                          // Row(
                          //   children: [
                          //     Container(
                          //       width: MediaQuery.of(context).size.width * 0.43,
                          //       padding: kPadding(),
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         border: Border.all(width: 1, color: Colors.grey),
                          //         borderRadius: BorderRadius.circular(10),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Color.fromARGB(255, 196, 196, 196),
                          //             blurRadius: 2.0,
                          //             spreadRadius: 1.3,
                          //             offset: Offset(2.0, 2),
                          //           ),
                          //         ],
                          //       ),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Complete Care Geno',
                          //             style: kkBoldTextStyle().copyWith(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           Text(
                          //             'Rs. 2100',
                          //             style: kTextStyle(),
                          //           ),
                          //           Text(
                          //             'Type: Package',
                          //             style: kTextStyle(),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     maxWidthSpan(),
                          //     Container(
                          //       width: MediaQuery.of(context).size.width * 0.43,
                          //       padding: kPadding(),
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         border: Border.all(width: 1, color: Colors.grey),
                          //         borderRadius: BorderRadius.circular(10),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Color.fromARGB(255, 196, 196, 196),
                          //             blurRadius: 2.0,
                          //             spreadRadius: 1.3,
                          //             offset: Offset(2.0, 2),
                          //           ),
                          //         ],
                          //       ),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Complete Care Geno',
                          //             style: kkBoldTextStyle().copyWith(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //           Text(
                          //             'Rs. 2100',
                          //             style: kTextStyle(),
                          //           ),
                          //           Text(
                          //             'Type: Package',
                          //             style: kTextStyle(),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          LSizedBox(),
                          Container(
                            padding: kPadding(),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 196, 196, 196),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.3,
                                  offset: Offset(2.0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Details',
                                  style: kkBoldTextStyle().copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                sSizedBox(),
                                Row(
                                  children: [
                                    Text(
                                      "Total  Cost: ",
                                      style: kTextStyle(),
                                    ),
                                    Text(
                                      'Rs. ${state.order['order']['price'][0]}',
                                      style: kkBoldTextStyle().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                sSizedBox(),
                                Row(
                                  children: [
                                    Text(
                                      "Payment Status: ",
                                      style: kTextStyle(),
                                    ),
                                    Text(
                                      'Paid',
                                      style: kkBoldTextStyle().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                sSizedBox(),
                                Row(
                                  children: [
                                    Text(
                                      "Report Status : ",
                                      style: kTextStyle(),
                                    ),
                                    Text(
                                      ' Delivered',
                                      style: kkBoldTextStyle().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                sSizedBox(),
                                Row(
                                  children: [
                                    Text(
                                      "Payment Method :",
                                      style: kTextStyle(),
                                    ),
                                    Text(
                                      state.order['payment_method'],
                                      style: kkBoldTextStyle().copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                sSizedBox(),
                                Row(
                                  children: [
                                    Text(
                                      "Test Type : ",
                                      style: kTextStyle(),
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.order['order']['name'][0]
                                            .toString(),
                                        style: kkBoldTextStyle().copyWith(
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

class OrderTile extends StatelessWidget {
  String? package;
  String? price;
  String? types;
  OrderTile({
    super.key,
    this.package,
    this.price,
    this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.43,
          padding: kPadding(),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 196, 196, 196),
                blurRadius: 2.0,
                spreadRadius: 1.3,
                offset: Offset(2.0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                package!,
                style: kkBoldTextStyle().copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                price!,
                style: kTextStyle(),
              ),
              Text(
                types!,
                style: kTextStyle(),
              ),
            ],
          ),
        ),
        maxWidthSpan(),
      ],
    );
  }
}
