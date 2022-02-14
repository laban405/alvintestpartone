import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

dislikeSnackBar() {
  return Get.snackbar("", "",
      titleText: Container(
        height: 0,
      ),
      messageText: Text(
        'Not Funny',
        style: TextStyle(fontSize: 14.0.sp, color: Color(0xffF79746)),
      ),
      borderRadius: 2.0.w,
      duration: Duration(seconds: 1),
      borderColor: Color(0xffF79746),
      animationDuration: Duration(milliseconds: 500),
      borderWidth: .250.w,
      maxWidth: 28.0.w,
      padding: EdgeInsets.fromLTRB(3.0.w,1.0.w,3.0.w,3.0.w),
      backgroundColor: Color(0xffF79746).withOpacity(0.5),
      margin: EdgeInsets.fromLTRB(10.0.w, 20.0.h, 50.0.w, 0.0.w));
}
