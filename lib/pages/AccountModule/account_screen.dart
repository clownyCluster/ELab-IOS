import 'package:elab/constant/constant.dart';
import 'package:elab/constant/k_button.dart';
import 'package:elab/pages/AccountModule/account_state.dart';
// import 'package:elab/pages/ReportModule/report_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  static const String id = 'AccountScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AccountState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "My Account Information",
          style: kkBoldTextStyle(),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
                            padding: kPadding(),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                state.fileName != null
                                    ? Container(
                                        height: 60,
                                        width: 60,
                                        child: Image.file(state.galleryImage!),
                                      )
                                    : Container(
                                        child: state.token == null
                                            ? CircleAvatar(
                                                radius: 30,
                                                child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/userprofile.png'),
                                                          fit: BoxFit.fill),
                                                    )),
                                              )

                                            //  Image.asset(
                                            //     'assets/images/userprofile.png')
                                            : CircleAvatar(
                                                backgroundImage: state
                                                        .profileResponse!
                                                        .data!
                                                        .profilePic!
                                                        .isEmpty
                                                    ? AssetImage(
                                                        'assets/icon/loading.gif')
                                                    : AssetImage(
                                                        'assets/images/profile.png'),
                                                radius: 30,
                                                child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: NetworkImage(state
                                                              .profileResponse!
                                                              .data!
                                                              .profilePic!),
                                                          fit: BoxFit.cover),
                                                    )),
                                              ),
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                ),
                                Column(
                                  children: [
                                    kSizedBox(),
                                    InkWell(
                                      onTap: () {
                                        // state.pickImage(ImageSource.camera);
                                        // state.pickImage(ImageSource.gallery);
                                        state.displayBottomSheet(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'Change Profile',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    kSizedBox(),
                                    // InkWell(
                                    //   onTap: () {
                                    //     state
                                    //         .uploadProfile(ImageSource.gallery);
                                    //   },
                                    //   child: Container(
                                    //     padding: EdgeInsets.all(10),
                                    //     decoration: BoxDecoration(
                                    //       color: primaryColor,
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //     ),
                                    //     child: Text(
                                    //       'Save Profile',
                                    //       style: TextStyle(color: Colors.white),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                kSizedBox(),
                              ],
                            ),
                          ),
                          LSizedBox(),
                          Container(
                            padding: kStandardPadding(),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
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
                                  'Full Name',
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),
                                TextFormField(
                                  // cursorColor: primaryColor,
                                  // onChanged: state.onNameChanged,
                                  controller: state.nameController,
                                  decoration: InputDecoration(
                                    // suffixIcon: Icon(Icons.calendar_month),
                                    isDense: true,

                                    // hintText: 'Enter Fullname',
                                    // hintText: state.profileResponse!.data!.name,
                                    hintText: state.profileResponse!.data!.name,

                                    hintStyle: kTextStyle()
                                        .copyWith(color: Colors.grey[500]),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),
                                TextField(
                                  // onChanged: state.onPhoneChanged,
                                  controller: state.phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // suffixIcon: Icon(Icons.calendar_month),
                                    isDense: true,
                                    // hintText: 'Enter Phone Number',
                                    hintText: state
                                        .profileResponse!.data!.contact
                                        .toString(),
                                    hintStyle: kTextStyle()
                                        .copyWith(color: Colors.grey[400]),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                  'Alternative Number',
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),
                                TextField(
                                  controller: state.emailController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    // suffixIcon: Icon(Icons.calendar_month),
                                    isDense: true,
                                    hintText: 'Alternative Number',
                                    hintStyle: kTextStyle()
                                        .copyWith(color: Colors.grey[400]),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),
                                //  TextField(
                                //   onChanged: state.onSelectGenderChanged,
                                //   decoration: InputDecoration(
                                //     // suffixIcon: Icon(Icons.calendar_month),
                                //     isDense: true,
                                //     hintText: 'enter you gender',
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
                                Container(
                                  height: 40,
                                  child: DropdownButtonFormField(
                                    borderRadius: BorderRadius.circular(10),
                                    autofocus: false,
                                    elevation: 0,
                                    onSaved: state.onSelectGenderChanged,
                                    // hint: Text('Select Your Gender'),
                                    // hint: Text(state
                                    //     .profileResponse!.data!.gender
                                    //     .toString()),
                                    isExpanded: false,
                                    isDense: true,
                                    focusColor: primaryColor,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                      ),
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                    ),
                                    value: state.genderList[0]['index'],
                                    onChanged: (val) {
                                      state.onSelectedGenderIndex(val);
                                    },
                                    items: state.genderList.map((e) {
                                      return DropdownMenuItem(
                                        value: e['index'],
                                        child: Text(
                                          e['name'].toString(),
                                          style: kTextStyle(),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                kSizedBox(),
                                Text(
                                  'Date of Birth',
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),

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
                                // TextField(
                                //   // onChanged: state.onDobChanged,
                                //   controller: state.dobController,
                                //   decoration: InputDecoration(
                                //     suffixIcon: Icon(Icons.calendar_month),
                                //     isDense: true,
                                //     // hintText: 'yyyy-mm-dd',
                                //     hintText: state.profileResponse!.data!.dob,
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
                                kSizedBox(),
                                Text(
                                  'Home Address',
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),
                                TextField(
                                  // onChanged: state.onHomeAddressChanged,
                                  controller: state.homeAddressController,
                                  decoration: InputDecoration(
                                    // suffixIcon: Icon(Icons.calendar_month),
                                    isDense: true,
                                    // hintText: 'Enter Address',
                                    hintText: state
                                        .profileResponse!.data!.homeAddress,
                                    hintStyle: kTextStyle()
                                        .copyWith(color: Colors.grey[400]),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                  'Working Address',
                                  style: kTextStyle().copyWith(
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                                sSizedBox(),
                                TextField(
                                  // onChanged: state.onWorkingAddressChanged,
                                  controller: state.workingAddressController,
                                  decoration: InputDecoration(
                                    // suffixIcon: Icon(Icons.calendar_month),
                                    isDense: true,

                                    // hintText: state
                                    //     .profileResponse!.data!.workAddress,
                                    // hintStyle: kTextStyle()
                                    //     .copyWith(color: Colors.grey[400]),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                kSizedBox(),
                                // Text(
                                //   'State',
                                //   style: kTextStyle()
                                //       .copyWith(color: Colors.grey[500]),
                                // ),
                                // sSizedBox(),
                                // TextField(
                                //   decoration: InputDecoration(
                                //     // suffixIcon: Icon(Icons.calendar_month),
                                //     isDense: true,
                                //     hintText: 'Enter State',
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
                                // kSizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: kPadding(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: kPadding(),
                          decoration: BoxDecoration(
                            // border: Border.all(width: 1,color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[700],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cancel',
                                style: kWhiteBoldTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      maxWidthSpan(),
                      InkWell(
                        onTap: () {
                          state.patchAccount();

                          state.uploadProfile();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: kPadding(),
                          decoration: BoxDecoration(
                            // border: Border.all(width: 1,color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Save Changes',
                                  style: kWhiteBoldTextStyle(),
                                ),
                              ),
                              maxWidthSpan(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
