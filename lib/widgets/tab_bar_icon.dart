import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class TabBarIcon extends StatelessWidget {
  const TabBarIcon(
      {required this.iconColor,required this.isTabSelected, required this.svgPic, Key? key})
      : super(key: key);

  final String svgPic;
  final bool isTabSelected;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 5.h,
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: isTabSelected
              ? const LinearGradient(
                  colors: [Color(0xffff827d), MColors.kPrimaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    MColors.kPrimaryColor.withOpacity(0.2),
                    MColors.kPrimaryColor.withOpacity(0.2)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
      child: SvgPicture.asset(
        svgPic,
        color: iconColor,
      ),
    );
  }
}
