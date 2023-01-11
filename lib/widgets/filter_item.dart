import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';


class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      margin: EdgeInsets.only(right: 1.5.w),
      decoration: BoxDecoration(
          color: MColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(18)
      ),
      child: Center(child: Text("Trending",style: TextStyle(
        color: Colors.white
      ),)),
    );
  }
}
