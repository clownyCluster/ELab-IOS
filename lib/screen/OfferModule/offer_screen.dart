import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/DetailPage/Offers_Details_Module/offers_details.dart';
import 'package:elab/screen/OfferModule/offer_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/NoInternet/no_internet_screen.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});
  static const String id = 'OfferScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OfferState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Offer'),
          ),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        body: state.isNetConnected == false
            ? ConnectivityScreen()
            : state.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  )
                : Container(
                    padding: kStandardPadding(),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: state.offerModelResponse!.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        mainAxisSpacing: 10.0, // Spacing between rows
                        crossAxisSpacing: 10.0, // Spacing between columns
                        childAspectRatio:
                            0.7, // Width to height ratio of each grid item
                      ),
                      itemBuilder: (context, index) {
                        return OffersTiles(
                          description:
                              state.offerModelResponse!.data![index].name,
                          discountPrice:
                              state.offerModelResponse!.data![index].price,
                          price: state
                              .offerModelResponse!.data![index].discountedPrice,
                          name: state.offerModelResponse!.data![index].name,
                          image:
                              state.offerModelResponse!.data![index].thumbnail,
                          slug: state.offerModelResponse!.data![index].slug,
                        );
                      },
                    ),
                  ));
  }
}

class OffersTiles extends StatelessWidget {
  String? name;
  String? price;
  String? discountPrice;
  String? description;
  String? image;
  String? slug;
  String? date;
  OffersTiles({
    this.image,
    this.description,
    this.discountPrice,
    this.name,
    this.price,
    this.date,
    this.slug,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, OffersDetailsScreen.id,
                arguments: slug);
          },
          child: Container(
            // width: MediaQuery.sizeOf(context).width * .4,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    color: Colors.grey,
                  ),
                ]),
            padding: sPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 6, top: 6, bottom: 5),
                        height: 100,
                        width: double.infinity,
                        child: Image.network(image!)),
                    Positioned(
                        top: -0,
                        right: -0,
                        child: Image.asset(
                          'assets/images/offers.png',
                          color: secondaryColor,
                          height: 24,
                        )),
                  ],
                ),
                // kSizedBox(),
                Text(
                  name!,
                  style: kBoldTextStyle(),
                ),
                sSizedBox(),
                Row(
                  children: [
                    Text(
                      'Rs. $price',
                      style: kBoldTextStyle(),
                    ),
                    maxWidthSpan(),
                    Text(
                      'Rs. $discountPrice',
                      style: kUnderline(),
                    )
                  ],
                ),
                sSizedBox(),
                Text(
                  // 'Complete haemogram is a test that measures the number of RBCs, WBCs and platelets in blood it also ... ',
                  description!,
                  style: kTextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
