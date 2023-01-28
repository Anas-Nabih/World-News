import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/widgets/arrow_back.dart';

class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({Key? key, required this.title, this.isFromHome = false})
      : super(key: key);

  final String title;
  final bool isFromHome;

  @override
  Widget build(BuildContext context) {
    return isFromHome
        ? Center(
          child: Text(title,
              style: TextStyle(
                  color: MColors.kPrimaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500)),
        )
        : Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ArrowBack(),
                SizedBox(width: 30.w),
                Text(title,
                    style: TextStyle(
                        color: MColors.kPrimaryColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          );
  }
}
