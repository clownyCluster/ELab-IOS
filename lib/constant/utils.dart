import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusNode(
      BuildContext context, FocusNode nextFocues, FocusNode currentFocues) {
    currentFocues.unfocus();
    FocusScope.of(context).requestFocus(nextFocues);
  }

  static showFlushBarMessage(BuildContext context, String message , String title) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          forwardAnimationCurve: Curves.decelerate,
          duration: Duration(seconds: 4),
          message: message,
          borderColor: Colors.grey,
          backgroundColor: const Color.fromARGB(255, 208, 205, 204),
          title: title,
          icon: Icon(
            Icons.error,
            color: const Color.fromARGB(255, 211, 209, 209),
          ),
          animationDuration: Duration(seconds: 2),
        )..show(context));
  }
}
