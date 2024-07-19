import 'package:elab/constant/constant.dart';
import 'package:elab/constant/k_text_form_field.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/AccountModule/account_screen.dart';
import 'package:elab/pages/BookForOtherModule/book_for_other_screen.dart';
import 'package:elab/pages/CheckoutModule/checkout_state.dart';
import 'package:elab/pages/PaymentModule/payment_screen.dart';
import 'package:elab/pages/Payment_for_self/payment_for_self_screen.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';

import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const String id = 'CheckoutScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CheckoutState>(context);

    var datePicker = DateTime.now();

    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: defaultAppBar('Checkout'),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : state.profileResponse!.data!.dob == null ||
                  state.profileResponse!.data!.dob!.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please Complete Your Profile To Continue",
                        style: kkBoldTextStyle(),
                      ),
                      kSizedBox(),
                      InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(context, AccountScreen.id);
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: kPadding(),
                          child: Center(
                            child: Text(
                              'continue',
                              style: kWhiteBoldTextStyle(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: kStandardPadding(),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/checkbox.png',
                                      ),
                                      minWidthSpan(),
                                      Text(
                                        'My Cart',
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
                                        'Check Out',
                                        style: kBoldTextStyle(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/check.png'),
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
                                color: Colors.grey[600],
                                height: 1,
                                thickness: 1,
                              ),
                              LSizedBox(),
                              Container(
                                padding: kStandardPadding(),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
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
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Book This Test For:',
                                      style: kkBoldTextStyle(),
                                    ),
                                    Divider(
                                      height: 1,
                                      thickness: 1,
                                    ),
                                    kSizedBox(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              state
                                                  .profileResponse!.data!.name!,
                                              style: kkBoldTextStyle()
                                                  .copyWith(fontSize: 13),
                                            ),
                                            sSizedBox(),
                                            Text(
                                              'Email Address :',
                                              style: kBoldTextStyle(),
                                            ),
                                            Container(
                                              width: 140,
                                              child: Text(
                                                // 'mail@company.com',
                                                state.profileResponse!.data!
                                                    .email!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: kkBoldTextStyle()
                                                    .copyWith(fontSize: 13),
                                              ),
                                            ),
                                            sSizedBox(),
                                            Text(
                                              'Date of Birth :',
                                              style: kBoldTextStyle(),
                                            ),
                                            Text(
                                              // '1989 - 04 - 15',
                                              state.profileResponse!.data!.dob
                                                  .toString(),
                                              style: kkBoldTextStyle()
                                                  .copyWith(fontSize: 13),
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
                                              state.profileResponse!.data!
                                                  .contact
                                                  .toString(),
                                              style: kkBoldTextStyle()
                                                  .copyWith(fontSize: 13),
                                            ),
                                            sSizedBox(),
                                            Text(
                                              'Gender :',
                                              style: kBoldTextStyle(),
                                            ),
                                            Text(
                                              // 'Male ',
                                              state.profileResponse!.data!
                                                  .gender!
                                                  .toString(),
                                              style: kkBoldTextStyle()
                                                  .copyWith(fontSize: 13),
                                            ),
                                            sSizedBox(),
                                            Text(
                                              'Address:',
                                              style: kkBoldTextStyle()
                                                  .copyWith(fontSize: 13),
                                            ),
                                            Container(
                                              width: 140,
                                              child: Text(
                                                state.profileResponse!.data!
                                                    .homeAddress!,
                                                overflow: TextOverflow.ellipsis,
                                                style: kBoldTextStyle()
                                                    .copyWith(fontSize: 13),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              LSizedBox(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Enter Date For Lab Visit : ',
                                    style: kTextStyle(),
                                  ),
                                  Icon(Icons.calendar_month),
                                ],
                              ),
                              sSizedBox(),

                              InkWell(
                                onTap: () {
                                  state.showDatePickerFunction(context);
                                },
                                child: Container(
                                  height: 50,
                                  padding: kPadding(),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.dateController.text.isEmpty
                                          ? ' -- Select Date -- '
                                          : state.dateController.text),
                                      Icon(
                                        Icons.calendar_month,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // TextField(
                              //   controller: state.dateController,
                              //   onChanged: state.onBookDateChanged,
                              //   decoration: InputDecoration(
                              //     suffixIcon: InkWell(
                              //         onTap: () {
                              //           state.showDatePickerFunction(context);
                              //         },
                              //         child: Icon(Icons.calendar_month)),
                              //     isDense: true,
                              //     hintText: 'yyyy-mm-dd',
                              //     // hintStyle: kTextStyle().copyWith(color: primaryColor),
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
                              LSizedBox(),
                              Row(
                                children: [
                                  Text('Enter Time For Lab Visit :'),
                                ],
                              ),
                              kSizedBox(),

                              InkWell(
                                onTap: () {
                                  state.showTime(context);
                                },
                                child: Container(
                                  height: 50,
                                  padding: kPadding(),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.timeController.text.isEmpty
                                          ? ' -- Select Time --  '
                                          : state.timeController.text),
                                      Icon(
                                        Icons.timer_sharp,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // TextField(
                              //   controller: state.timeController,
                              //   // onChanged:  state.timeController,
                              //   decoration: InputDecoration(
                              //     suffixIcon: InkWell(
                              //       onTap: () {
                              //         state.showTime(context);
                              //       },
                              //       child: Icon(
                              //         Icons.timer_sharp,
                              //         size: 15,
                              //       ),
                              //     ),
                              //     isDense: true,
                              //     hintText: 'hh:mm',
                              //     // hintStyle: kTextStyle().copyWith(color: primaryColor),
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
                              LSizedBox(),
                              InkWell(
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Book This Test For Someone Else',
                                        style: kBoldTextStyle()
                                            .copyWith(color: primaryColor),
                                      ),
                                      minWidthSpan(),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 12,
                                        color: primaryColor,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, BookForOtherScreen.id);
                                },
                              )
                            ],
                          ),
                        ),
                      ),

                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [

                      //   ],
                      // ),
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
                              Text('Rs:${state.cartListResponse!.totalPrice}',
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
                            onTap: () {
                              if (state.dateController.text.isEmpty ||
                                  state.timeController.text.isEmpty) {
                                ToastService().e("Please select date and time");
                              } else {
                                Navigator.pushNamed(
                                    context, PaymentForMySelfScreen.id,
                                    arguments: {
                                      "book_time":
                                          state.timeController.text as String,
                                      "book_date":
                                          state.dateController.text as String,
                                    });
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}
