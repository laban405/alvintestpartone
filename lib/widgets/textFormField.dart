import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

InputDecoration textFormField(BuildContext context, String hintText) {
  return InputDecoration(
    labelText: hintText,

  );
}

InputDecoration textFormFieldBG(BuildContext context, String hintText) {
  return InputDecoration(
    fillColor: Colors.grey,
    contentPadding:
        EdgeInsets.only(left: 3.0.w, right: 3.0.w, bottom: 1.0.w, top: 1.0.w),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    ),
  );
}
