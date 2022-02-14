import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

showLoading({required String message}){
  Get.defaultDialog(
    backgroundColor: Colors.white,
    radius: 1.0.w,
    titleStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.grey[700]
    ),
    title: "Please wait...",
    content: const CircularProgressIndicator(),
    barrierDismissible: false
  );
}

dismissLoadingWidget(){
  if (kDebugMode) {
    print('dimiss loading widget');
  }
  Get.back();
}