import 'package:flutter/material.dart';

import 'constant.dart';

class kTextField extends StatelessWidget {
  String? hintText;
  String? labelText;
  String? errorMessage;
  final void Function(String)? onChanged;
  TextInputType? inputType;
  String? initialText;
  double? radius;
  double? focusedRadius;
  kTextField(
      {this.inputType,
      this.initialText,
      this.errorMessage,
      this.onChanged,
      this.hintText,
      this.focusedRadius,
      this.radius,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor:primaryColor,
      
      initialValue: initialText,
      keyboardType: inputType,
      // controller: addPostState.unitPriceController,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(focusedRadius ?? 0)),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return errorMessage;
        }
      },
    );
  }
}
