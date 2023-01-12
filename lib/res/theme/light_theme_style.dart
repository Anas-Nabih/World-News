import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';

class LightThemeStyle{
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,

      /// Colors
      scaffoldBackgroundColor: MColors.kLightScaffoldBG,
      iconTheme:const IconThemeData(color: MColors.kPrimaryColor) ,

      hintColor: MColors.kDarkHintColor,
      /// Text Styles
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white,fontSize: 14.sp, fontWeight: FontWeight.w600),
        subtitle1: TextStyle(color: Colors.white.withOpacity(0.85),fontWeight: FontWeight.w400,fontSize: 12.sp),
        subtitle2: TextStyle(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 9.sp),
        headlineLarge: TextStyle(color: Colors.white,fontSize: 14.sp, fontWeight: FontWeight.w600),
        bodyText1:  TextStyle(color:MColors.kTextHolder,fontSize: 14.sp,),
      ),

      /// Bottom Sheet Theme Data
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: MColors.kDarkScaffoldBG,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),


      /// List Tile Theme
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white,
      ),
    );
  }

}