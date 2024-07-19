import 'package:elab/constant/constant.dart';
import 'package:elab/pages/DetailPage/PackageDetailsModule/package_screen.dart';
import 'package:elab/pages/FilterModule/package_module/package_screen.dart';
import 'package:elab/pages/HealthPackagesModule/health_packages_state.dart';
// import 'package:elab/screen/HomeModule/home_display.dart';
import 'package:elab/screen/Loading_Module/page_loading.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../constant/ui_helpers.dart';
import '../FilterModule/test_module/test_filter_screen.dart';
import '../NoInternet/no_internet_screen.dart';
// import '../DetailPage/Hemogram_Module/hemogram_screen.dart';b

class HealthPackagesScreen extends StatelessWidget {
  const HealthPackagesScreen({super.key});
  static const String id = 'HealthPackagesScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HealthPackagesState>(context);
    return state.isLoading == true
        ? PageLoading(
            title: 'Heath Package',
          )
        : Scaffold(
            // backgroundColor: Colors.grey[200],
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Heath Package"),
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
                                style: kBoldTextStyle(),
                              )),
                          sSizedBox(),
                          InkWell(
                              onTap: () {
                                state.onHighTolow();
                                navigator!.pop();
                              },
                              child: Text(
                                'Low To High ',
                                style: kBoldTextStyle(),
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
                                return CheckboxListTile(
                                  visualDensity: VisualDensity(
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
                                );
                              }).toList()),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PackageFilterScreen.id,
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
                : state.searchController.text.isNotEmpty
                    ? Container(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          // itemCount: 20,
                          itemCount: state.kidneyResponse!.data!.length,

                          itemBuilder: (context, index) {
                            String? name =
                                state.kidneyResponse!.data![index].name!;

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
                                                  .kidneyResponse!
                                                  .data![index]
                                                  .icon!)),
                                          maxWidthSpan(),
                                          Text(state.kidneyResponse!
                                              .data![index].name!),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, PackageScreen.id,
                                      arguments: state
                                          .kidneyResponse!.data![index].slug);
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
                            kSizedBox(),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: state.packagePrice.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 0.85,
                                  ),
                                  itemBuilder: (context, index) {
                                    final item = state.packageList[index];
                                    final packageData =
                                        state.kidneyResponse!.data!.firstWhere(
                                            (data) => data.name == item);

                                    final price = state.packagePrice[index];
                                    final packagePrice = state
                                        .kidneyResponse!.data!
                                        .firstWhere((data) =>
                                            data.discountedPrice == price);

                                    final highprice =
                                        state.highToLowPrice[index];
                                    final packageHighPrice = state
                                        .kidneyResponse!.data!
                                        .firstWhere((data) =>
                                            data.discountedPrice == highprice);

                                    if (state.highToLow == false) {
                                      return InkWell(
                                        child: HealthTile(
                                          state: state,
                                          slug: packageHighPrice.slug,
                                          discountPrice:
                                              packageHighPrice.discountedPrice,
                                          title: packageHighPrice.name,
                                          price: packageHighPrice.price,
                                          image: packageHighPrice.icon,
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, PackageScreen.id,
                                              arguments: {
                                                'slug': packageHighPrice.slug,
                                                'title': packageHighPrice.name,
                                              });
                                        },
                                      );
                                    }
                                    if (state.lowToHigh == false) {
                                      return InkWell(
                                        child: HealthTile(
                                          state: state,
                                          slug: packagePrice.slug,
                                          discountPrice:
                                              packagePrice.discountedPrice,
                                          title: packagePrice.name,
                                          price: packagePrice.price,
                                          image: packagePrice.icon,
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, PackageScreen.id,
                                              arguments: {
                                                'slug': packagePrice.slug,
                                                'title': packagePrice.name,
                                              });
                                        },
                                      );
                                    }
                                    return InkWell(
                                      child: HealthTile(
                                        state: state,
                                        slug: packageData.slug,
                                        discountPrice:
                                            packageData.discountedPrice,
                                        title: packageData.name,
                                        price: packageData.price,
                                        image: packageData.icon,
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PackageScreen.id,
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

class HealthTile extends StatelessWidget {
  String? image;
  String? title;
  int? price;
  int? discountPrice;
  String? slug;
  final HealthPackagesState state;
  // final int? index;

  HealthTile({
    required this.state,
    this.slug,
    this.image,
    this.price,
    this.title,
    this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.42,

      padding: kPadding(),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: const Color.fromARGB(255, 201, 201, 201)),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: sPadding,
            height: 80,
            width: double.infinity,
            child: Center(
              // child: Image.asset(
              //   'assets/images/kidney.png',
              //   scale: 0.8,
              // ),
              child: Image.network(
                image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          sSizedBox(),
          Text(
            title!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: kBoldTextStyle(),
          ),
          sSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Rs.  $discountPrice ', style: kBoldTextStyle()),
              minWidthSpan(),
              Text(
                'Rs.$price',
                style: kUnderline(),
              ),
            ],
          ),
          kSizedBox(),
          InkWell(
            onTap: () {
              if (state.token == null) {
                ToastService().e('You have to login to access this feature');
              } else {
                state.postPackage(slug);
              }
            },
            child: Container(
              width: 160,
              padding: sPadding,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Center(
                child: InkWell(
                  child: Text(
                    "Add to Cart",
                    // style: TextStyle(color: Colors.white),
                    style: kWhiteBoldTextStyle(),
                  ),
                  // onTap: () {
                  //   ToastService().s("Add To Cart Successfully");

                  // },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
