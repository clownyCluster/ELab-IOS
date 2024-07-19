import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../constant/ui_helpers.dart';
import '../../pages/NoInternet/no_internet_screen.dart';
import 'home_display_state.dart';

class HomeDisplay extends StatelessWidget {
  static const String id = "HomeDisplay";

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeDisplayState>(context);
    return Scaffold(
      body: state.isNetConnected == false
          ? ConnectivityScreen()
          : state.onNavigation.elementAt(state.selectedIndext),
      bottomNavigationBar: Container(
        padding: sPadding,
        color: Colors.white,
        child: GNav(
          activeColor: Colors.white,
          iconSize: 25,
          color: Colors.grey,
          gap: 8,
          tabBorderRadius: 15,
          tabBackgroundColor: primaryColor,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.shopping_bag,
              text: "Offer",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
          selectedIndex: state.selectedIndext,
          onTabChange: (index) {
            state.onSelectedIndextChanged(index);
          },
        ),
      ),
    );
  }
}
