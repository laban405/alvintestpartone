import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

likeSnackBar() {
  return Get.snackbar("", "",
      titleText: Container(
        height: 0,
      ),
      messageText: Text(
        'Funny',
        style: TextStyle(fontSize: 14.0.sp, color: Color(0xff45C09C)),
      ),
      duration: Duration(seconds: 1),
      borderColor: Color(0xff45C09C),
      borderWidth: 0.250.w,
      animationDuration: Duration(milliseconds: 500),
      borderRadius: 2.0.w,
      maxWidth: 21.0.w,
      padding: EdgeInsets.fromLTRB(3.0.w,1.0.w,3.0.w,3.0.w),
 //     dismissDirection: SnackDismissDirection.HORIZONTAL,
      backgroundColor: Color(0xff45C09C).withOpacity(0.5),
      margin: EdgeInsets.fromLTRB(50.0.w, 20.0.h, 10.0.w, 0.0.w));
}
