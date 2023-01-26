 import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/widgets/arrow_back.dart';

class ScreenAppBar extends StatelessWidget {
  const ScreenAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
