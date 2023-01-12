import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';


class FilterItem extends StatelessWidget {
  const FilterItem({
    required this.category,
    required this.bgColor,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  final String category;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      margin: EdgeInsets.only(right: 1.5.w),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(18),
        border: Border.all(color: MColors.kPrimaryColor)
      ),
      child: Center(child: Text(category,style: TextStyle(
        color: textColor
      ),)),
    );
  }
}
