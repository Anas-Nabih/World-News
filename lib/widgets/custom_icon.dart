
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    required this.svgPic,
    required this.onTapped,
    Key? key,
  }) : super(key: key);

  final String svgPic;
  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 5.h,width: 5.h,
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            color: MColors.kPrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6)
        ),
        child: SvgPicture.asset(
            svgPic,color: MColors.kPrimaryColor.withOpacity(0.8),
        ),
      ),
    );
  }
}