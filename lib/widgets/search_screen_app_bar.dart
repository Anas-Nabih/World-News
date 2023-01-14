import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/generated/l10n.dart';
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
          padding: EdgeInsets.only(top: 2.h,bottom: 1.h),
          child: Text(S.of(context).search,style:TextStyle(
             color: MColors.kPrimaryColor,
             fontSize: 12.sp,
             fontWeight: FontWeight.w500)),
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