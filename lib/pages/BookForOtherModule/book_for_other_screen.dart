import 'package:elab/constant/constant.dart';
import 'package:elab/pages/BookForOtherModule/book_for_other_state.dart';
import 'package:elab/pages/PaymentOptionsModule/payment_options_screen.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../CheckoutModule/checkout_screen.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class BookForOtherScreen extends StatelessWidget {
  static const String id = 'BookForOtherScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<BookForOtherState>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: defaultAppBar('Checkout'),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: kStandardPadding(),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              padding: kPadding(),
                              decoration: BoxDecoration(
                                // border: Border.all(width: 1, color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 196, 196, 196),
                                    blurRadius: 2.0,
                                    spreadRadius: 1.3,
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
                                    'Book This Test For:',
                                    style: kkBoldTextStyle(),
                                  ),
                                  sSizedBox(),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                  ),
                                  kSizedBox(),
                                  Text(
                                    'Full Name',
                                    style: kTextStyle()
                                        .copyWith(color: Colors.grey[700]),
                                  ),
                                  sSizedBox(),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Name   can\'t be null';
                                      }
                                      return null;
                                    },
                                    onChanged: state.onNameChanged,
                                    decoration: InputDecoration(
                                      // suffixIcon: Icon(Icons.calendar_month),
                                      isDense: true,
                                      hintText: 'Enter Fullname',
                                      hintStyle: kTextStyle()
                                          .copyWith(color: Colors.grey[400]),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.1),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  kSizedBox(),
                                  Text(
                                    'Phone Number',
                                    style: kTextStyle()
                                        .copyWith(color: Colors.grey[500]),
                                  ),
                                  sSizedBox(),
                                  TextFormField(
                                    onChanged: state.oncontactChanged,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    decoration: InputDecoration(
                                      // suffixIcon: Icon(Icons.calendar_month),
                                      isDense: true,
                                      hintText: 'Enter Phone Number',
                                      hintStyle: kTextStyle()
                                          .copyWith(color: Colors.grey[400]),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.1),

                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Number  can\'t be null';
                                      }
                                      if (value.isNotEmpty &&
                                          value.length != 10) {
                                        return 'Number must be 10 Character';
                                      }
                                      return null;
                                    },
                                  ),
                                  kSizedBox(),
                                  Text(
                                    'Email Address',
                                    style: kTextStyle()
                                        .copyWith(color: Colors.grey[500]),
                                  ),
                                  sSizedBox(),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email   can\'t be null';
                                      }
                                      const emailRegex =
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

                                      // Create a RegExp object
                                      final regExp = RegExp(emailRegex);

                                      if (!regExp.hasMatch(value)) {
                                        return 'Invalid email format';
                                      }
                                      return null;
                                    },
                                    onChanged: state.onEmailChanged,
                                    decoration: InputDecoration(
                                      // suffixIcon: Icon(Icons.calendar_month),
                                      isDense: true,
                                      hintText: 'Enter Email Address',
                                      hintStyle: kTextStyle()
                                          .copyWith(color: Colors.grey[400]),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.1),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  kSizedBox(),
                                  Text(
                                    'Select Gender',
                                    style: kTextStyle()
                                        .copyWith(color: Colors.grey[500]),
                                  ),
                                  sSizedBox(),
                                  Container(
                                    height: 50,
                                    child: DropdownButtonFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Gender   can\'t be null';
                                        }
                                        return null;
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      autofocus: false,
                                      elevation: 0,
                                      hint: Text('Select Your Gender'),
                                      isExpanded: false,
                                      isDense: true,
                                      focusColor: primaryColor,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: primaryColor),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                      ),
                                      onChanged: (val) {
                                        state.onGenderChanged(val);
                                      },
                                      items: state.gender.map((e) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            e,
                                            style: kTextStyle(),
                                          ),
                                          value: e,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  kSizedBox(),
                                  Text(
                                    'Date of Birth',
                                    style: kTextStyle()
                                        .copyWith(color: Colors.grey[500]),
                                  ),
                                  // TextFormField(
                                  //   onChanged: state.onDobChanged,
                                  //   decoration: InputDecoration(
                                  //     suffixIcon: Icon(Icons.calendar_month),
                                  //     isDense: true,
                                  //     hintText: 'yyyy-mm-dd',
                                  //     hintStyle: kTextStyle()
                                  //         .copyWith(color: Colors.grey[400]),
                                  //     filled: true,
                                  //     fillColor: Colors.grey.withOpacity(0.1),
                                  //     border: OutlineInputBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(10),
                                  //         borderSide: BorderSide.none),
                                  //     focusedBorder: OutlineInputBorder(
                                  //       borderSide:
                                  //           BorderSide(color: primaryColor),
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      state.showDobPicker(context);
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
                                          Text(state.dobController.text.isEmpty
                                              ? ' -- Select Date -- '
                                              : state.dobController.text),
                                          Icon(
                                            Icons.calendar_month,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  kSizedBox(),
                                  Text(
                                    'Address',
                                    style: kTextStyle()
                                        .copyWith(color: Colors.grey[500]),
                                  ),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Address   can\'t be null';
                                      }
                                      return null;
                                    },
                                    onChanged: state.onAddressChanged,
                                    decoration: InputDecoration(
                                      // suffixIcon: Icon(Icons.calendar_month),
                                      isDense: true,
                                      hintText: 'Enter Address',
                                      hintStyle: kTextStyle()
                                          .copyWith(color: Colors.grey[400]),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.1),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            kSizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Enter Date For Lab Visit : ',
                                  style: kTextStyle(),
                                ),
                                Icon(Icons.calendar_month),
                              ],
                            ),
                            sSizedBox(),
                            // TextFormField(
                            //   onChanged: state.onBookDateChanged,
                            //   decoration: InputDecoration(
                            //     suffixIcon: Icon(Icons.calendar_month),
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
                            LSizedBox(),
                            Row(
                              children: [
                                Text('Enter Time For Lab Visit :'),
                              ],
                            ),
                            kSizedBox(),
                            // TextFormField(
                            //   onChanged: state.onBookTimeChanged,
                            //   decoration: InputDecoration(
                            //     suffixIcon: Icon(
                            //       Icons.timer_sharp,
                            //       size: 15,
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
                                        ? ' -- Select Time -- '
                                        : state.timeController.text),
                                    Icon(
                                      Icons.calendar_month,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            LSizedBox(),
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Book This Test Myself',
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
                                Navigator.pushNamed(context, CheckoutScreen.id);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: kPadding(),
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
                          children: [
                            Text(
                              'Total payment',
                              style: kBoldTextStyle(),
                            ),
                            sSizedBox(),
                            Text('Rs.15,755', style: kkBoldTextStyle()),
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: 200,
                            padding: kPadding(),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              border: Border.all(width: 1, color: primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                state.timeController.text.isEmpty ||
                                state.dobController.text.isEmpty) {
                              ToastService().e('PLease select date and time');
                            }
                            if (formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, PaymentOptionsScreen.id,
                                  arguments: {
                                    'name': state.name,
                                    'contact': state.contact,
                                    'email': state.email,
                                    'dob': state.dobController.text,  
                                    'address': state.address,
                                    'gender': state.selectedGender,
                                    'booked_date': state.dateController.text,
                                    'booked_time': state.timeController.text,
                                  });
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
