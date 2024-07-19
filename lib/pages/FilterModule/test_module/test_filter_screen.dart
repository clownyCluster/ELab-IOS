import 'package:elab/constant/constant.dart';
import 'package:elab/pages/FilterModule/test_module/test_filter_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/ui_helpers.dart';
import '../../../service/toast_service.dart';
import '../../DetailPage/Hemogram_Module/hemogram_screen.dart';
import '../../NoInternet/no_internet_screen.dart';

class TestFilterScreen extends StatelessWidget {
  TestFilterScreen({super.key});
  static const String id = 'TestFilterScreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TestFilterState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: state.isNetConnected == false
            ? ConnectivityScreen()
            : state.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : Container(
                    padding: kStandardPadding(),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.68,
                      ),
                      itemCount: state.filterResponse!.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: IndividualTiles(
                            slug: state.filterResponse!.data![index].slug,
                            state: state,
                            index: index,
                            description:
                                state.filterResponse!.data![index].shortContent,
                            title: state.filterResponse!.data![index].name,
                            discountedPrice: state
                                .filterResponse!.data![index].discountedPrice,
                            image: state.filterResponse!.data![index].thumbnail,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, HemogramScreen.id,
                                arguments: {
                                  'slug':
                                      state.filterResponse!.data![index].slug,
                                  'name':
                                      state.filterResponse!.data![index].name
                                });
                          },
                        );
                      },
                    ),
                  ));
  }
}

class IndividualTiles extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  String? price;
  String? discountedPrice;
  int? index;
  final TestFilterState state;
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
