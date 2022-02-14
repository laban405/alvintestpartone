import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

InputDecoration textFormField(BuildContext context, String labelText,String hintText) {
  return InputDecoration(
    contentPadding:
    EdgeInsets.only(left: 3.0.w, right: 3.0.w, bottom: 1.0.w, top: 1.0.w),
    labelText: labelText,
    labelStyle: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w600),
    hintText: hintText,
    hintStyle:const TextStyle(color: Colors.grey),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
      borderSide: BorderSide(color: Colors.grey[600]!),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    ),
  );
}