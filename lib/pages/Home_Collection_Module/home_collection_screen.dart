import 'package:elab/constant/constant.dart';
import 'package:elab/constant/ui_helpers.dart';
import 'package:elab/pages/DetailPage/Hemogram_Module/hemogram_screen.dart';
import 'package:elab/pages/DetailPage/PackageDetailsModule/package_screen.dart';
import 'package:elab/pages/Home_Collection_Module/home_collection_state.dart';
import 'package:elab/pages/TestsModule/individule_test_screen.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../NoInternet/no_internet_screen.dart';

String stripHtmlIfNeeded(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}

class HomeColloctionScreen extends StatelessWidget {
  static const String id = 'HomeColloctionScreen';
  const HomeColloctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeCollectionState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Collection'),
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
      ),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
              : Container(
                  padding: kStandardPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              state.onPackagSelected();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.433,
                              padding: kPadding(),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                  color: state.selectedViewIndex == 0
                                      ? primaryColor
                                      : Colors.white),
                              child: Center(
                                child: Text('Package',
                                    style: state.selectedViewIndex == 0
                                        ? kkWhiteBoldTextStyle()
                                            .copyWith(fontSize: 15)
                                        : kkBoldTextStyle()
                                            .copyWith(fontSize: 15)),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              state.onTestSelected();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.433,
                              padding: kPadding(),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                  color: state.selectedViewIndex == 1
                                      ? primaryColor
                                      : Colors.white),
                              child: Center(
                                child: Text('Test',
                                    style: state.selectedViewIndex == 1
                                        ? kkWhiteBoldTextStyle()
                                            .copyWith(fontSize: 15)
                                        : kkBoldTextStyle()
                                            .copyWith(fontSize: 15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      kSizedBox(),
                      Visibility(
                        visible: state.selectedViewIndex == 0,
                        child: Container(
                          child: Expanded(
                            child: GridView.builder(
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount: state
                                  .homeCollectionResponse!.packages!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // Number of columns in the grid
                                mainAxisSpacing: 10.0, // Spacing between rows
                                crossAxisSpacing:
                                    10.0, // Spacing between columns
                                childAspectRatio:
                                    0.80, // Width to height ratio of each grid item
                              ),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PackageScreen.id,
                                            arguments: {
                                              'title': state
                                                  .homeCollectionResponse!
                                                  .packages![index]
                                                  .name,
                                              'slug': state
                                                  .homeCollectionResponse!
                                                  .packages![index]
                                                  .slug,
                                            });
                                      },
                                      child: PackageTile(
                                        slug: state.homeCollectionResponse!
                                            .packages![index].slug,
                                        state: state,
                                        title: state.homeCollectionResponse!
                                            .packages![index].name,
                                        discountedPrice: state
                                            .homeCollectionResponse!
                                            .packages![index]
                                            .discountedPrice,
                                        image: state.homeCollectionResponse!
                                            .packages![index].icon,
                                        price: state.homeCollectionResponse!
                                            .packages![index].price,
                                        // description: state.homeCollectionResponse!
                                        //     .packages![index].slug,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: state.selectedViewIndex == 1,
                        child: Container(
                          child: Expanded(
                            child: GridView.builder(
                                // shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 0.78,
                                ),
                                itemCount:
                                    state.homeCollectionResponse!.tests!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, HemogramScreen.id,
                                          arguments: {
                                            'slug': state
                                                .homeCollectionResponse!
                                                .tests![index]
                                                .slug,
                                            'title': state
                                                .homeCollectionResponse!
                                                .tests![index]
                                                .name,
                                          });
                                    },
                                    child: TestTile(
                                      state: state,
                                      slug: state.homeCollectionResponse!
                                          .tests![index].slug,
                                      // description: state.homeCollectionResponse!
                                      //     .tests![index].shortContent,
                                      discountedPrice: state
                                          .homeCollectionResponse!
                                          .tests![index]
                                          .discountedPrice,
                                      image: state.homeCollectionResponse!
                                          .tests![index].thumbnail,
                                      price: state.homeCollectionResponse!
                                          .tests![index].price,
                                      title: state.homeCollectionResponse!
                                          .tests![index].name,
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class PackageTile extends StatelessWidget {
  String? title;
  // String? description;
  int? price;
  int? discountedPrice;
  String? image;
  String? slug;
  HomeCollectionState state;
  PackageTile({
    super.key,
    required this.state,
    // this.description,
    this.discountedPrice,
    this.price,
    this.slug,
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
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 204, 204, 204)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              // Row(
              //   children: [
              //     Expanded(
              //       child: Text(
              //         // 'Complete haemogram is a test that measures the number of RBCs, WBCs  and platelets in blood it also ... ',
              //         description!,
              //         overflow: TextOverflow.ellipsis,
              //         maxLines: 1,
              //       ),
              //     ),
              //   ],
              // ),
              // kSizedBox(),
              InkWell(
                onTap: () {
                  if (state.token == null) {
                    ToastService()
                        .e('You have to login to access this feature');
                  } else {
                    state.postCart(slug, 'package');
                  }
                },
                child: Container(
                  width: 160,
                  padding: kPadding(),
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: kWhiteBoldTextStyle(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // kSizedBox(),
      ],
    );
  }
}

class TestTile extends StatelessWidget {
  String? title;
  // String? description;
  int? price;
  int? discountedPrice;
  String? image;
  String? slug;
  HomeCollectionState state;
  TestTile({
    super.key,
    required this.state,
    // this.description,
    this.discountedPrice,
    this.price,
    this.slug,
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
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 204, 204, 204)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 180,
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
              // Row(
              //   children: [
              //     Expanded(
              //       child: Text(
              //         // 'Complete haemogram is a test that measures the number of RBCs, WBCs  and platelets in blood it also ... ',
              //         description!,
              //         overflow: TextOverflow.ellipsis,
              //         maxLines: 1,
              //       ),
              //     ),
              //   ],
              // ),
              // kSizedBox(),
              InkWell(
                onTap: () {
                  if (state.token == null) {
                    ToastService()
                        .e('You have to login to access this feature');
                  } else {
                    state.postCart(slug, 'test');
                  }
                },
                child: Container(
                  width: 160,
                  padding: kPadding(),
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: kWhiteBoldTextStyle(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
