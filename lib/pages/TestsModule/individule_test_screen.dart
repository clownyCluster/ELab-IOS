import 'package:elab/pages/DetailPage/Hemogram_Module/hemogram_screen.dart';
import 'package:elab/pages/FilterModule/test_module/test_filter_screen.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../constant/ui_helpers.dart';
import '../../screen/Loading_Module/page_loading.dart';
import '../NoInternet/no_internet_screen.dart';
import 'individule_test_state.dart';

class IndividuleTestScreen extends StatelessWidget {
  const IndividuleTestScreen({super.key});
  static const String id = 'IndividuleTestScreen';
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<IndividuleTestState>(context);
    return state.isLoading == true
        ? PageLoading(
            title: 'Test',
          )
        : Scaffold(
            // backgroundColor: Colors.grey[200],
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Test"),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              actions: [
                Builder(
                  builder: (context) {
                    return InkWell(
                      child: Padding(
                        padding: kHorizontalPadding(),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          size: 30,
                        ),
                      ),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                        Navigator.canPop(context);
                      },
                    );
                  },
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // padding: kStandardPadding(),
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: TextFormField(
                    controller: state.searchController,
                    onChanged: state.onSearch,
                    decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: InkWell(
                            onTap: () {
                              state.onClear();
                            },
                            child: state.searchController.text.isNotEmpty
                                ? Icon(Icons.clear)
                                : Text('')),
                        prefixIcon: Icon(
                          Icons.search,
                          color: primaryColor,
                        ),
                        hintText: "Search",
                        fillColor: whiteColor,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: primaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 201, 190, 190)),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
            ),

            endDrawer: SafeArea(
              child: Drawer(
                  width: MediaQuery.of(context).size.width * .7,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: kStandardPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sort By :',
                            style: kkBoldTextStyle(),
                          ),
                          InkWell(
                              onTap: () {
                                state.onLowToHigh();
                                navigator!.pop();
                              },
                              child: Text(
                                'High To Low',
                                style: kkBoldTextStyle().copyWith(
                                  fontSize: 14,
                                ),
                              )),
                          sSizedBox(),
                          InkWell(
                              onTap: () {
                                state.onHighTolow();
                                navigator!.pop();
                              },
                              child: Text(
                                'Low To High ',
                                style: kkBoldTextStyle().copyWith(
                                  fontSize: 14,
                                ),
                              )),
                          kSizedBox(),
                          Text(
                            'Filter By:',
                            style: kkBoldTextStyle(),
                          ),
                          kSizedBox(),
                          Text(
                            'Conditions',
                            style: kkBoldTextStyle().copyWith(fontSize: 15),
                          ),
                          kSizedBox(),
                          Text(
                            'Filter By:',
                            style: kkBoldTextStyle(),
                          ),
                          kSizedBox(),
                          Text(
                            'Conditions',
                            style: kkBoldTextStyle().copyWith(fontSize: 15),
                          ),
                          kSizedBox(),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  state.conditionsModelResponse!.data!.map((e) {
                                bool isChecked =
                                    state.checkedIds.contains(e.id);
                                return CheckboxListTile(
                                  visualDensity: VisualDensity(
                                      horizontal: -1, vertical: -4),
                                  // contentPadding: EdgeInsets.zero,
                                  activeColor: primaryColor,
                                  value: isChecked,
                                  onChanged: (val) {
                                    state.onCheckBoxSelected(e.id, val);
                                    print(e.id);
                                  },
                                  title: Text(
                                    e.name.toString(),
                                    style: kkTextStyle(),
                                  ),
                                );
                              }).toList()),
                          Text(
                            'Specialized',
                            style: kkBoldTextStyle().copyWith(fontSize: 15),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  state.specializedResponse!.data!.map((e) {
                                bool isChecked =
                                    state.checkedSpecializedIds.contains(e.id);
                                return CheckboxListTile(
                                  visualDensity: VisualDensity(
                                      horizontal: -1, vertical: -4),
                                  // contentPadding: EdgeInsets.zero,
                                  activeColor: primaryColor,
                                  value: isChecked,
                                  onChanged: (val) {
                                    state.onSpecializedBoxSelected(e.id, val);
                                    print(e.id);
                                  },
                                  title: Text(
                                    e.name.toString(),
                                    style: kkTextStyle(),
                                  ),
                                );
                              }).toList()),
                          Text(
                            'Lifestyle Disorders',
                            style: kkBoldTextStyle().copyWith(fontSize: 15),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: state.lifestyleResponse!.data!.map((e) {
                                bool isChecked =
                                    state.checkedLifestyleIds.contains(e.id);
                                return InkWell(
                                  child: CheckboxListTile(
                                    visualDensity: const VisualDensity(
                                        horizontal: -1, vertical: -4),
                                    // contentPadding: EdgeInsets.zero,
                                    activeColor: primaryColor,
                                    value: isChecked,
                                    onChanged: (val) {
                                      state.onLifestyleBoxSelected(e.id, val);
                                      print(e.id);
                                    },
                                    title: Text(
                                      e.name.toString(),
                                      style: kkTextStyle(),
                                    ),
                                  ),
                                );
                              }).toList()),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, TestFilterScreen.id,
                                  arguments: {
                                    'conditions': state.checkedIds,
                                    'specializeds': state.checkedSpecializedIds,
                                    'lifestyle_disorders':
                                        state.checkedLifestyleIds
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),
                              padding: kPadding(),
                              width: double.infinity,
                              child: Text(
                                'Search',
                                style: kkWhiteBoldTextStyle(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            body: state.isNetConnected == false
                ? ConnectivityScreen()
                : state.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : state.searchController.text.isNotEmpty
                        ? Container(
                            child: ListView.builder(
                              padding: kStandardPadding(),
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.testModelResponse!.data!.length,
                              itemBuilder: (context, index) {
                                String? name = state.testModelResponse!
                                    .data![index].shortContent!;

                                if (name.toLowerCase().contains(state
                                    .searchController.text
                                    .toString()
                                    .toLowerCase())) {
                                  return InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  height: 25,
                                                  width: 30,
                                                  child: Image.network(state
                                                      .testModelResponse!
                                                      .data![index]
                                                      .thumbnail!)),
                                              maxWidthSpan(),
                                              Text(state.testModelResponse!
                                                  .data![index].name!),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, HemogramScreen.id,
                                          arguments: {
                                            'slug': state.testModelResponse!
                                                .data![index].slug,
                                            'name': state.testModelResponse!
                                                .data![index].name,
                                          });
                                    },
                                  );
                                }
                                return Column();
                              },
                            ),
                          )
                        : Container(
                            padding: kStandardPadding(),
                            child: Column(
                              children: [
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //   children: [
                                //     Expanded(
                                //       child: TextFormField(
                                //         cursorColor: primaryColor,
                                //         controller: state.searchController,
                                //         onChanged: state.onChange,
                                //         decoration: InputDecoration(
                                //             hintText: 'Search Package',
                                //             prefixIcon: Icon(Icons.search),
                                //             focusColor: primaryColor,
                                //             hoverColor: primaryColor,
                                //             prefixIconColor: primaryColor,
                                //             hintStyle: kkTextStyle(),
                                //             focusedBorder: OutlineInputBorder(
                                //                 borderRadius: BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: primaryColor)),
                                //             enabledBorder: OutlineInputBorder(
                                //                 borderSide: BorderSide(
                                //                     color: Color.fromARGB(
                                //                         255, 201, 190, 190)),
                                //                 borderRadius:
                                //                     BorderRadius.circular(10))),
                                //       ),
                                //     ),
                                //     maxWidthSpan(),
                                //     Row(
                                //       children: [
                                //         Builder(
                                //           builder: (context) {
                                //             return InkWell(
                                //               child: Image.asset(
                                //                 'assets/images/menu.png',
                                //               ),
                                //               onTap: () {
                                //                 Scaffold.of(context).openEndDrawer();
                                //               },
                                //             );
                                //           },
                                //         ),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                kSizedBox(),
                                Expanded(
                                  child: GridView.builder(
                                      itemCount: state.packagePrice.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,
                                        childAspectRatio: 0.63,
                                      ),
                                      itemBuilder: (context, index) {
                                        final item = state.packageList[index];
                                        final packageData = state
                                            .testModelResponse!.data!
                                            .firstWhere(
                                                (data) => data.name == item);

                                        final price = state.packagePrice[index];
                                        final packagePrice = state
                                            .testModelResponse!.data!
                                            .firstWhere((data) =>
                                                data.discountedPrice == price);

                                        final highprice =
                                            state.highToLowPrice[index];
                                        final packageHighPrice = state
                                            .testModelResponse!.data!
                                            .firstWhere((data) =>
                                                data.discountedPrice ==
                                                highprice);

                                        if (state.highToLow == false) {
                                          return InkWell(
                                            child: IndividualTiles(
                                              state: state,
                                              slug: packageHighPrice.slug,
                                              discountedPrice: packageHighPrice
                                                  .discountedPrice,
                                              description:
                                                  packageHighPrice.shortContent,
                                              title: packageHighPrice.name,
                                              price: packageHighPrice.price,
                                              image: packageHighPrice.thumbnail,
                                              index: index,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  IndividuleTestScreen.id,
                                                  arguments: {
                                                    'slug':
                                                        packageHighPrice.slug,
                                                    'title':
                                                        packageHighPrice.name,
                                                  });
                                            },
                                          );
                                        }
                                        if (state.lowToHigh == false) {
                                          return InkWell(
                                            child: IndividualTiles(
                                              state: state,
                                              slug: packagePrice.slug,
                                              description:
                                                  packagePrice.shortContent,
                                              discountedPrice:
                                                  packagePrice.discountedPrice,
                                              title: packagePrice.name,
                                              price: packagePrice.price,
                                              image: packagePrice.thumbnail,
                                              index: index,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  IndividuleTestScreen.id,
                                                  arguments: {
                                                    'slug': packagePrice.slug,
                                                    'title': packagePrice.name,
                                                  });
                                            },
                                          );
                                        }
                                        if (state.highToLow == false) {
                                          return InkWell(
                                            child: IndividualTiles(
                                              state: state,
                                              slug: packageHighPrice.slug,
                                              discountedPrice: packageHighPrice
                                                  .discountedPrice,
                                              description:
                                                  packageHighPrice.shortContent,
                                              title: packageHighPrice.name,
                                              price: packageHighPrice.price,
                                              image: packageHighPrice.thumbnail,
                                              index: index,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  IndividuleTestScreen.id,
                                                  arguments: {
                                                    'slug':
                                                        packageHighPrice.slug,
                                                    'title':
                                                        packageHighPrice.name,
                                                  });
                                            },
                                          );
                                        }
                                        return InkWell(
                                          child: IndividualTiles(
                                            state: state,
                                            slug: packageData.slug,
                                            discountedPrice:
                                                packageData.discountedPrice,
                                            description:
                                                packageData.shortContent,
                                            title: packageData.name,
                                            price: packageData.price,
                                            image: packageData.thumbnail,
                                          ),
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, HemogramScreen.id,
                                                arguments: {
                                                  'slug': packageData.slug,
                                                  'title': packageData.name,
                                                });
                                          },
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
          );
  }
}

class IndividualTiles extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  int? price;
  int? discountedPrice;
  int? index;
  final IndividuleTestState state;
  String? slug;
  // String? price;
  IndividualTiles({
    required this.state,
    this.slug,
    this.index,
    this.description,
    this.image,
    this.title,
    this.price,
    this.discountedPrice,
    super.key,
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
            // boxShadow: [
            //   BoxShadow(
            //     color: const Color.fromARGB(255, 196, 196, 196),
            //     blurRadius: 2.0, // soften the shadow
            //     spreadRadius: 1.3, //extend the shadow
            //     offset: Offset(
            //       2.0,
            //       2,
            //     ),
            //   )
            // ],
          ),
          width: MediaQuery.of(context).size.width * 0.42,
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title!,
                      // 'Hemogram',
                      style: kkBoldTextStyle(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              sSizedBox(),
              Row(
                children: [
                  Text(
                    'Rs.$discountedPrice',
                    style: kkBoldTextStyle().copyWith(fontSize: 13),
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
                      description!,
                      // 'Complete haemogram is a test that measures the number of RBCs, WBCs  and platelets in blood it also ... ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              kSizedBox(),
              InkWell(
                onTap: () {
                  if (state.token == null) {
                    ToastService()
                        .e('You have to login to access this feature');
                  } else {
                    state.postCart(slug!);
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
