import 'package:elab/constant/constant.dart';
import 'package:elab/pages/DetailPage/Offers_Details_Module/offers_datails_state.dart';
// import 'package:elab/screen/HomeScreenModule/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/ui_helpers.dart';
import '../Hemogram_Module/hemogram_screen.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(
    RegExp(r'<[^>]*>|&[^;]+;'),
    ' ',
  );
}

class OffersDetailsScreen extends StatelessWidget {
  const OffersDetailsScreen({super.key});
  static const String id = 'OffersDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OffersDetailsState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            'Offers Details',
          ),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white),
      body: state.isLoading == true
          ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: kStandardPadding(),
                    child: Column(
                      children: [
                        Container(
                          padding: kPadding(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              // border: Border.all(width: 1, color: Colors.black)
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.5,
                                  color:
                                      const Color.fromARGB(255, 180, 180, 180),
                                  spreadRadius: 2,
                                  // blurStyle: BlurStyle.outer,

                                  offset: Offset(2, 2),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 100,
                                child: Image.network(
                                  state.offersDetailsResponse!.data!.thumbnail!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              kSizedBox(),
                              Row(
                                children: [
                                  Text(
                                    state.offersDetailsResponse!.data!.title!,
                                    style: kkBoldTextStyle().copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              kSizedBox(),
                              Row(
                                children: [
                                  Text(
                                    'Rs. ${state.offersDetailsResponse!.data!.price}',
                                    style: kUnderline(),
                                  ),
                                  maxWidthSpan(),
                                  Text(
                                    'Rs. ${state.offersDetailsResponse!.data!.discountedPrice}',
                                    style: kBoldTextStyle(),
                                  ),
                                ],
                              ),
                              kSizedBox(),
                              Text(
                                stripHtmlIfNeeded(
                                  state
                                      .offersDetailsResponse!.data!.description!
                                      .replaceAll('\n', '\n'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        LSizedBox(),
                        Container(
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // Number of columns in the grid
                                mainAxisSpacing: 10.0, // Spacing between rows
                                crossAxisSpacing:
                                    10.0, // Spacing between columns
                                childAspectRatio:
                                    0.7, // Width to height ratio of each grid item
                              ),
                              itemCount: state
                                  .offersDetailsResponse!.data!.tests!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, HemogramScreen.id,
                                        arguments: state.offersDetailsResponse!
                                            .data!.tests![index].slug);
                                  },
                                  child: PackageTile(
                                    description: state.offersDetailsResponse!
                                        .data!.tests![index].shortContent,
                                    discountedPrice: state
                                        .offersDetailsResponse!
                                        .data!
                                        .tests![index]
                                        .price,
                                    image: state.offersDetailsResponse!.data!
                                        .tests![index].thumbnail,
                                    price: state.offersDetailsResponse!.data!
                                        .tests![index].discountedPrice,
                                    title: state.offersDetailsResponse!.data!
                                        .tests![index].name,
                                  ),
                                );
                              }),
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

class PackageTile extends StatelessWidget {
  String? title;
  String? description;
  int? price;
  int? discountedPrice;
  String? image;
  PackageTile({
    super.key,
    this.description,
    this.discountedPrice,
    this.price,
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: sPadding,
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
                  2.0, // Move to right 5  horizontally
                  2.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset(
              //   'assets/images/service.png',
              //   width: 150,
              // ),
              Container(
                  height: 100,
                  width: 150,
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                  )),
              sSizedBox(),
              Text(
                title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: kkBoldTextStyle().copyWith(fontSize: 14),
              ),
              sSizedBox(),
              Row(
                children: [
                  Text(
                    'Rs.$discountedPrice',
                    style: kBoldTextStyle(),
                  ),
                  minWidthSpan(),
                  Text('Rs.$price', style: kUnderline()),
                ],
              ),
              sSizedBox(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      // 'Complete haemogram is a test that measures the number of RBCs, WBCs  and platelets in blood it also ... ',
                      description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              kSizedBox(),
              // Container(
              //   width: 160,
              //   padding: kPadding(),
              //   decoration: BoxDecoration(
              //     // border: Border.all(width: 1),
              //     borderRadius: BorderRadius.circular(10),
              //     color: primaryColor,
              //   ),
              //   child: Center(
              //     child: Text(
              //       "Add To Cart",
              //       style: kWhiteBoldTextStyle(),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        kSizedBox(),
      ],
    );
  }
}
