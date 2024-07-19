import 'package:elab/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../constant/ui_helpers.dart';
import '../../screen/HomeModule/home_display.dart';
import '../../service/toast_service.dart';

class HealthCheckupScreen extends StatelessWidget {
  const HealthCheckupScreen({super.key});
  static const String id = 'HealthCheckupScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Health Check Up"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body:  Container(
        padding: kStandardPadding(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                        isDense: true,
                        hintText: 'Search For Packages Here',
                        hintStyle:
                            kTextStyle().copyWith(color: Colors.grey[500]),
                        filled: true,
                        focusColor: primaryColor,
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
                  ),
                ),
                maxWidthSpan(),
                Image.asset(
                  'assets/images/menu.png',
                  height: 48,
                ),
              ],
            ),
            LSizedBox(),
            Expanded(
              child: GridView.builder(
                 physics: BouncingScrollPhysics(),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  mainAxisSpacing: 10.0, // Spacing between rows
                  crossAxisSpacing: 10.0, // Spacing between columns
                  childAspectRatio:
                      0.88, // Width to height ratio of each grid item
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CheckUpTile(),
                    ],
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

class CheckUpTile extends StatelessWidget {
  const CheckUpTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/liver.png'),
          kSizedBox(),
          Text(
            'Liver Function  \nProfile',
            style: kBoldTextStyle(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rs.5,500',
                style: kBoldTextStyle(),
              ),
              minWidthSpan(),
              Text('Rs.7,500', style: kUnderline()),
            ],
          ),
          kSizedBox(),
          Container(
            width: 160,
            padding: sPadding,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: primaryColor),
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
            ),
            child: InkWell(
              child: Center(
                child: Text(
                  "Add to Cart",
                  // style: TextStyle(color: Colors.white),
                  style: kWhiteBoldTextStyle(),
                ),
              ),
               onTap: () {
                  ToastService().s("Add To Cart Successfully");
                  Navigator.popAndPushNamed(context, HomeDisplay.id);
                },
            ),
          ),
        ],
      ),
    );
  }
}
