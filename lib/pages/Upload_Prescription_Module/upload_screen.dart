import 'package:elab/constant/constant.dart';
// import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/Upload_Prescription_Module/upload_state.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class UploadePrescriptionScreen extends StatelessWidget {
  const UploadePrescriptionScreen({super.key});
  static const String id = 'UploadePrescriptionScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UploadePrescriptionState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Upload Prescriptions'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body:
          // state.isLoading == true
          //     ? Center(
          //         child: CircularProgressIndicator(color: primaryColor),
          //       )
          //     :
          Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
              child: Container(
                padding: kStandardPadding(),
                child: Column(
                  children: [
                    Text(
                      'Please Please attach the prescription. Our doctors will receive or return any urgent calls.',
                      style: kkBoldTextStyle().copyWith(
                        fontSize: 14,
                      ),
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
                            color: const Color.fromARGB(255, 196, 196, 196),
                            blurRadius: 2.0,
                            spreadRadius: 1.3,
                            offset: Offset(
                              2.0,
                              2,
                            ),
                          )
                        ],
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Book Test',
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name   can\'t be null';
                                }
                                return null;
                              },
                              onChanged: state.onNameChange,
                              decoration: InputDecoration(
                                // suffixIcon: Icon(Icons.calendar_month),
                                isDense: true,

                                hintText: 'Enter Fullname',
                                hintStyle: kTextStyle()
                                    .copyWith(color: Colors.grey[400]),
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Number  can\'t be null';
                                }
                                if (value.isNotEmpty && value.length != 10) {
                                  return 'Number must be 10 Character';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                state.onNumberChange(val);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // suffixIcon: Icon(Icons.calendar_month),
                                isDense: true,
                                hintText: 'Enter Phone Number',
                                hintStyle: kTextStyle()
                                    .copyWith(color: Colors.grey[400]),
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
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
                              onChanged: state.onEmailChange,
                              decoration: InputDecoration(
                                // suffixIcon: Icon(Icons.calendar_month),
                                isDense: true,
                                hintText: 'Enter Email Address',
                                hintStyle: kTextStyle()
                                    .copyWith(color: Colors.grey[400]),
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
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
                                borderRadius: BorderRadius.circular(10),
                                autofocus: false,
                                elevation: 0,
                                // onSaved: state.onSelectedGenderChange,
                                // hint: Text('Select Your Gender'),
                                hint: Text('Select Gender'),

                                isExpanded: false,
                                isDense: true,
                                focusColor: primaryColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                ),
                                onChanged: state.onSelectedGenderIndex,
                                items: state.genderList.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e['name'].toString(),
                                      style: kTextStyle(),
                                    ),
                                    value: e['index'],
                                  );
                                }).toList(),

                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null) {
                                    return ('Gender   can\'t be null');
                                  }
                                },
                              ),
                            ),
                            kSizedBox(),
                            Text(
                              'Date of Birth',
                              style: kTextStyle()
                                  .copyWith(color: Colors.grey[500]),
                            ),
                            // TextFormField(
                            //   onChanged: state.onDobChange,
                            //   decoration: InputDecoration(
                            //     suffixIcon: Icon(Icons.calendar_month),
                            //     isDense: true,
                            //     hintText: 'yyyy/mm/dd',
                            //     hintStyle: kTextStyle()
                            //         .copyWith(color: Colors.grey[400]),
                            //     filled: true,
                            //     fillColor: Colors.grey.withOpacity(0.1),
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
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
                            sSizedBox(),
                            // Padding(
                            //     padding: kHorizontalPadding(),
                            //     child: state.isLoading == true
                            //         ? state.dobController.text.isEmpty
                            //             ? Text(
                            //                 'Date of birth can\'t be null',
                            //                 style: kkTextStyle().copyWith(
                            //                     color: const Color.fromARGB(
                            //                         255, 212, 45, 33),
                            //                     fontSize: 12),
                            //               )
                            //             : SizedBox()
                            //         : SizedBox()),
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
                              onChanged: state.onAddressChange,
                              decoration: InputDecoration(
                                // suffixIcon: Icon(Icons.calendar_month),
                                isDense: true,
                                hintText: 'Enter Address',
                                hintStyle: kTextStyle()
                                    .copyWith(color: Colors.grey[400]),
                                filled: true,
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            kSizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    state.displayBottomSheet(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Pick Image',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                kSizedBox(),
                                state.fileName != null
                                    ? Container(
                                        height: 60,
                                        width: 60,
                                        child: Image.file(state.galleryImage!),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    kSizedBox(),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: primaryColor,
                            value: state.isCheckBox,
                            onChanged: (val) {
                              state.onCheckBoxChanged();
                            }),
                        Text(
                          'I agree to the Terms of Use and Privacy Policy.',
                          style: kBoldTextStyle(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: kPadding(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (state.dobController.text.isEmpty) {
                      ToastService().e('Please Select Date Of Birth.');
                    } else {
                      if (formKey.currentState!.validate()) {
                        if (state.isCheckBox == true) {
                          state.uploadPrescription();
                        } else {
                          ToastService()
                              .e('Please Select Terms and Privacy Policy.');
                        }
                      }
                    }
                  },
                  child: Container(
                    padding: kPadding(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'SUBMIT REQUEST',
                          style: kBoldTextStyle().copyWith(
                            color: Colors.white,
                          ),
                        ),
                        minWidthSpan(),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
