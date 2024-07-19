

import 'package:elab/Drawer_Pages/Drawer_Model/drawer_screen.dart';
import 'package:elab/Drawer_Pages/Drawer_Model/drawer_state.dart';
import 'package:elab/screen/OfferModule/offer_screen.dart';
import 'package:elab/screen/OfferModule/offer_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../CartModule/cart_screen.dart';
import '../CartModule/cart_state.dart';
import '../ProfileModule/profile_screen.dart';
import '../ProfileModule/profile_state.dart';

class HomeDisplayState extends ChangeNotifier {
  HomeDisplayState(context) {
    checkInternetConnection();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      selectedIndext = 1;
    }
  }

  bool isNetConnected = true;
  checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    notifyListeners();
    isNetConnected = isConnected;
    notifyListeners();
  }

  int selectedIndext = 0;
  onSelectedIndextChanged(int value) {
    selectedIndext = value;
    notifyListeners();
  }

  List onNavigation = [
    ChangeNotifierProvider(
      child: DrawerScreen(),
      create: (_) => DrawerState(),
    ),
    ChangeNotifierProvider(
      child: CartScreen(),
      create: (_) => CartState(),
    ),
    ChangeNotifierProvider(
      child: OfferScreen(),
      create: (_) => OfferState(),
    ),
    ChangeNotifierProvider(
      child: ProfileScreen(),
      create: (_) => ProfileState(),
    ),
  ];
}
