import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';

class LightThemeStyle {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,

      /// Colors
      scaffoldBackgroundColor: MColors.kLightScaffoldBG,
      iconTheme: const IconThemeData(color: MColors.kPrimaryColor),
      hintColor: MColors.kLightHintColor,

      /// Text Styles
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
          headline2: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.70)),
          headline3: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
          headline4: TextStyle(
              color: MColors.kPrimaryColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600),
          subtitle1: TextStyle(
              color: Colors.black.withOpacity(0.85),
              fontWeight: FontWeight.w400,
              fontSize: 11.sp),
          subtitle2: TextStyle(fontSize: 9.sp, color: Colors.black54),
          headlineLarge: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
          bodyText1:
              TextStyle(fontSize: 10.sp, color: Colors.black.withOpacity(0.9)),
          bodyText2:
              TextStyle(fontSize: 9.sp, color: Colors.black.withOpacity(.6))),

      /// Bottom Sheet Theme Data
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: MColors.kDarkScaffoldBG,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      /// List Tile Theme
      listTileTheme: ListTileThemeData(
        iconColor: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
