import 'package:flutter/material.dart';

import 'app_dimens.dart';


enum HeadlineSize {
  xxxSmall,
  xxSmall,
  xSmall,
  small,
  medium,
  smallMedium,
  large,
  other
}

class KHeadline extends StatelessWidget {
  final HeadlineSize size;
  final String text;
  final TextOverflow? overflow;
  final Color color;
  final bool center;
  final bool baseline;
  final FontWeight fontWeight;

  const KHeadline(this.text,
      {this.size = HeadlineSize.small,
      this.overflow,
      this.color = Colors.blue,
      this.center = false,
      this.baseline = false,
      this.fontWeight = FontWeight.w500,
      Key? key})
      : super(key: key);

  TextStyle? getTextStyleBySize(BuildContext context, HeadlineSize size) {
    switch (size) {
      case HeadlineSize.xxxSmall:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeXXXSmall,
              fontWeight: fontWeight,
            );
      case HeadlineSize.xxSmall:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeXXSmall,
              fontWeight: fontWeight,
            );
      case HeadlineSize.xSmall:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeXSmall,
              fontWeight: fontWeight,
            );
      case HeadlineSize.small:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeSmall,
              fontWeight: fontWeight,
            );
      case HeadlineSize.other:
        return Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeOther,
              fontWeight: fontWeight,
            );
      case HeadlineSize.medium:
        return Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeMedium,
              fontWeight: fontWeight,
            );
      case HeadlineSize.smallMedium:
        return Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeSmallMedium,
              fontWeight: fontWeight,
            );
      case HeadlineSize.large:
        return Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color,
              fontSize: AppDimens.headlineFontSizeLarge,
              fontWeight: fontWeight,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: center ? TextAlign.center : null,
      style: getTextStyleBySize(context, size),
    );
  }
}
