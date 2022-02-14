import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

void showToast(BuildContext context, String text,Color bgColor,Color textColor) {

  Fluttertoast.showToast(

    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: 12.0.sp
  );
}