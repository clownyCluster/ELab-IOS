import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/constant/constant.dart';
// import 'package:elab/global.dart';
import 'package:elab/pages/CheckoutModule/checkout_screen.dart';
import 'package:elab/screen/CartModule/cart_state.dart';
import 'package:elab/service/toast_service.dart';
import 'package:flutter/material.dart';
// import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../pages/NoInternet/no_internet_screen.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'CartSreen';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: Center(child: Text('Cart')),
        actions: [
          if (state.token != null)
            Padding(
              padding: kHorizontalPadding(),
              child: InkWell(
                onTap: () {
                  state.clearCart();
                },
                child: Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            )
        ],
        leading: Container(),
      ),
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.token == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You have to login to access this feature'),
                      LSizedBox(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor)),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginScreen.id, (route) => false);
                          },
                          child: Text('Proceed to Login'))
                    ],
                  ),
                )
              : state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    )
                  : Column(
                      children: [
                        state.cartListResponse!.data == null ||
                                state.cartListResponse!.data == [] ||
                                state.cartListResponse!.data!.isEmpty
                            ? Expanded(
                                child: Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/empty_cart.png',
                                          // height: MediaQuery.of(context).size.height *
                                          //     0.4,
                                          // width: MediaQuery.of(context).size.width *
                                          //     0.4,
                                        ),
                                        Text(
                                          'Cart is Empty',
                                          style: kkBoldTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  padding: kStandardPadding(),
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount:
                                        state.cartListResponse!.data!.length,
                                    itemBuilder: (context, index) {
                                      return CartTile(
                                        state: state,
                                        image: state.cartListResponse!
                                            .data![index].image,
                                        name: state.cartListResponse!
                                            .data![index].name,
                                        price: state.cartListResponse!
                                            .data![index].price!,
                                        index: index,
                                        slug: state.cartListResponse!
                                            .data![index].slug,
                                        quantity: state.cartListResponse!
                                            .data![index].quantity,
                                        originalPrice: state.cartListResponse!
                                            .data![index].originalPrice!,
                                      );
                                    },
                                  ),
                                ),
                              ),
                        Container(
                          padding: kPadding(),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 196, 196, 196),
                                blurRadius: 2.0, // soften the shadow
                                spreadRadius: 1.3, //extend the shadow
                                offset: Offset(
                                  2.0,
                                  2.0,
                                ),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total payment',
                                    style: kBoldTextStyle(),
                                  ),
                                  sSizedBox(),
                                  Text(
                                      'Rs.${state.cartListResponse!.totalPrice!}',
                                      style: kkBoldTextStyle()),
                                ],
                              ),
                              InkWell(
                                child: Container(
                                  padding: kPadding(),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    border: Border.all(
                                        width: 1, color: primaryColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Proceed To Checkout',
                                    style: kWhiteBoldTextStyle(),
                                  ),
                                ),
                                onTap: () {
                                  state.cartListResponse!.data == null ||
                                          state.cartListResponse!.data!
                                              .isEmpty ||
                                          state.cartListResponse!.data == []
                                      ? ToastService().e(
                                          'please add to cart before you proceed')
                                      : Navigator.pushNamed(
                                          context, CheckoutScreen.id);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
    );
  }
}

class CartTile extends StatelessWidget {
  final String? name;
  final int? price;
  final String? slug;
  final int? index;
  final int? originalPrice;
  final int? quantity;
  final CartState state;
  final String? image;

  CartTile({
    this.name,
    this.image,
    this.price,
    this.slug,
    this.originalPrice,
    this.index,
    this.quantity,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: kPadding(),
          // width: MediaQuery.of(context).size.width * 0.82,
          width: double.infinity,
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 197, 197, 197)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 196, 196, 196),
                blurRadius: 2.0, // soften the shadow
                spreadRadius: 1.3, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 5  horizontally
                  2.0, // Move to bottom 5 Vertically
                ),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset('assets/images/kidney.png'),
                      Container(
                        height: 40,
                        width: 50,
                        child: Image.network(
                          image!,
                          height: 30,
                          width: 50,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              );
                            }
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                      sSizedBox(),
                      Row(
                        children: [
                          Container(
                            width: 250,
                            child: Text(
                              name!,
                              style: kTextStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      state.deleteCart(slug!);
                    },
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
              // Image.network(image!),

              // sSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rs.${price! * quantity!}",
                        style: kTextStyle(),
                      ),
                      maxWidthSpan(),
                      Text(
                        'Rs.${originalPrice! * quantity!}',
                        style: kUnderline(),
                      ),
                    ],
                  ),
                  Container(
                    width: 90,
                    // height: 20,
                    padding: kHorizontalPadding(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.remove,
                            size: 17,
                          ),
                          onTap: () {
                            state.onCountSub(index!, slug!);

                            print('tap vayo hai');
                          },
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        Text('${quantity!}'),
                        Text(
                          '|',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.add,
                            size: 17,
                          ),
                          onTap: () {
                            state.onCountAdd(
                              index!,
                              slug!,
                            );
                            print('tap vayo hai');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        kSizedBox(),
      ],
    );
  }
}
