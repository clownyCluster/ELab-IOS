import 'package:flutter/material.dart';

/// App Dimensions class to reuse values that are used throughout the layout
/// Using a single source of dimensions will create robust ui development,
/// and also make design changes easier.

class AppDimens {
  static const pagePadding = EdgeInsets.all(20);
  static const pagePaddingX = EdgeInsets.symmetric(horizontal: 20);
  static const pagePaddingY = EdgeInsets.symmetric(vertical: 20);
  static const pagePaddingLarge = EdgeInsets.all(32);

  static const CartRadius = 8.0;
  static const CartBorderRadius = BorderRadius.all(Radius.circular(CartRadius));
  static const double CartPaddingSize = 20;
  static const CartPadding = EdgeInsets.all(CartPaddingSize);
  static const inputBorderRadius = BorderRadius.all(Radius.circular(8));
  static const inputPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const chipPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const buttonFontSizeSmall = 15.0;
  static const buttonFontSizeMedium = 16.0;
  static const buttonFontSizeLarge = 17.0;

  static const iconButtonSizeSmall = 24.0;
  static const iconButtonSizeLarge = 32.0;

  static const buttonPaddingSmall =
      EdgeInsets.symmetric(horizontal: 20, vertical: 12);
  static const buttonPaddingMedium =
      EdgeInsets.symmetric(horizontal: 24, vertical: 20);
  static const buttonPaddingLarge =
      EdgeInsets.symmetric(horizontal: 32, vertical: 24);

  static const double bodyFontSize = 14;

  static const double headlineFontSizeXXXSmall = 10;
  static const double headlineFontSizeXXSmall = 12;
  static const double headlineFontSizeXSmall = 15;
  static const double headlineFontSizeSmall = 17;
  static const double headlineFontSizeOther = 20;
  static const double headlineFontSizeMedium = 30;
  static const double headlineFontSizeSmallMedium = 22;
  static const double headlineFontSizeLarge = 40;

  static const double multiSelectPadding = 8;
}
