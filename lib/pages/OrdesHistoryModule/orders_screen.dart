import 'package:elab/constant/constant.dart';
import 'package:elab/pages/OrdersHistoryDetailsModule/order_details_screen.dart';
import 'package:elab/pages/OrdesHistoryModule/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../NoInternet/no_internet_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const String id = "OrderScreen";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OrderState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : state.orderResponse!.data == null ||
                      state.orderResponse!.data == [] ||
                      state.orderResponse!.data!.isEmpty
                  ? Center(
                      child: Container(
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/nodata.png'),
                            kSizedBox(),
                            Text(
                              'No Data Found !',
                              style: kkBoldTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      padding: kStandardPadding(),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: state.orderResponse!.data!.length,
                              itemBuilder: (context, index) {
                                return OrderTiles(
                                  // state: state,
                                  date: state
                                      .orderResponse!.data![index].bookedDate,
                                  orderStatus: state
                                      .orderResponse!.data![index].orderStatus
                                      .toString(),
                                  orderid:
                                      state.orderResponse!.data![index].orderId,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, OrderDetailsScreen.id,
                                        arguments: state
                                            .orderResponse!.data![index].id);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

// Column(
//                   children: [
//                     OrderTiles(
//                       date: state.order[0]['booked_date'],
//                       orderStatus: state.order[0]['order_status'].toString(),
//                       orderid: state.order[0]['order_id'],
//                     ),
//                   ],
//                 ),

class OrderTiles extends StatelessWidget {
  String? orderid;
  String? date;
  String? orderStatus;
  final void Function()? onPressed;

  OrderTiles({
    this.date,
    this.orderStatus,
    this.orderid,
    required this.onPressed,
    // required this.state,
    super.key,
  });
  // final OrderState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                orderid!,
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
                    date!,
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
                        orderStatus!,
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
                    // onTap: () {
                    // Navigator.pushNamed(context, OrderDetailsScreen.id,
                    //     arguments: state.order[1]['id']
                    //     );
                    // },
                    onTap: onPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
        LSizedBox(),
      ],
    );
  }
}
