import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';

class DarkThemeStyle{
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,

      /// Colors
      scaffoldBackgroundColor: MColors.kDarkScaffoldBG,
      iconTheme:const IconThemeData(color: MColors.kPrimaryColor) ,

      hintColor: MColors.kDarkHintColor,
      /// Text Styles
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white,fontSize: 14.sp, fontWeight: FontWeight.w600),
        subtitle1: TextStyle(color: Colors.white.withOpacity(0.85),
            fontWeight: FontWeight.w400,fontSize: 11.sp),
        subtitle2: TextStyle(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 9.sp),
        headlineLarge: TextStyle(color: Colors.white,fontSize: 14.sp, fontWeight: FontWeight.w600),
        bodyText1:  TextStyle(
            fontSize: 10.sp,
            color: Colors.white.withOpacity(0.85)
        ),
        bodyText2: TextStyle(
          fontSize: 9.sp, color: Colors.white.withOpacity(.6))
      ),

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