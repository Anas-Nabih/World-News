import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';

class CustomSliderIndicator extends StatelessWidget {
  const CustomSliderIndicator({
    Key? key,
    required this.providerIndex,
  }) : super(key: key);

  final int  providerIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => Container(
        height: 2.h,width: 1.5.h,
        margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == providerIndex ?MColors.kPrimaryColor :Colors.white
        ),
      )),
    );
  }
}