import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme().copyWith(
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff2A6185)
      ),
      colorScheme: ColorScheme.light(
        error: Colors.red[600]!,
        background: const Color(0xffF9FBFC),
        surface: const Color(0xffF9FBFC),
        primary: const Color(0xff2A6185),
        primaryVariant: const Color(0xff2A6185),
        secondary: const Color(0xffA99A84),
        onPrimary: const Color(0xff2A6185),
      ),
      scaffoldBackgroundColor: const Color(0xffECEEF2),
      errorColor: Colors.red[600],
      primaryColor: const Color(0xff2A6185),
      disabledColor: Colors.grey[600],
      textTheme: TextTheme(
        caption: TextStyle(
            color: Colors.grey[600],
            fontSize: 11.0.sp,
            fontWeight: FontWeight.w400),
        bodyText1: TextStyle(
            color: Colors.grey[900],
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600),
        bodyText2: TextStyle(
            color: Colors.grey[800],
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w600),
        subtitle1: TextStyle(
            color: const Color(0xff262626),
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600),
        headline6: TextStyle(
            color: Colors.grey, fontSize: 16.0.sp, fontWeight: FontWeight.w700),
        headline5: TextStyle(
            color: Colors.grey, fontSize: 26.0.sp, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xff2A6185))),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff2A6185),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.only(
            left: 3.0.w, right: 3.0.w, bottom: 1.0.w, top: 1.0.w),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Color(0xff91899D)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
          borderSide: const BorderSide(color: Color(0xff91899D)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
          borderSide: const BorderSide(color: Color(0xff91899D)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.0.w)),
          borderSide: const BorderSide(color: Color(0xff2A6185)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff2A6185),
        unselectedItemColor: Color(0xffB4B4B4),
      ));

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
  );
}
