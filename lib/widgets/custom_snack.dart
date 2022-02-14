import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

showSnack({textColor,color, title, message}) {
  return Get.snackbar(title, message,
      backgroundColor: color,
      colorText: textColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5),
      margin: EdgeInsets.fromLTRB(
        2.0.w,
        2.0.w,
        2.0.w,
        8.0.w,
      ));
}
