import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/widgets/arrow_back.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/custom_text_field.dart';

class SearchScreeAppBar extends StatelessWidget {
  const SearchScreeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            children: [
              const ArrowBack(),
              SizedBox(width: 30.w,),
              Text("Search",style:TextStyle(
                  color: MColors.kPrimaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500))
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            const Expanded(child: CustomTextField(isFromHome: false,)),
            SizedBox(width: 5.w),
            CustomIcon(onTapped: () {}, svgPic: "assets/svg/filter.svg")
          ],
        )
      ],
    );
  }
}