import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    required this.prefixText,required this.suffixText,
    Key? key,
  }) : super(key: key);

  final String prefixText,suffixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prefixText,style: TextStyle(
              fontSize: 11.sp
          ),),
          Text(suffixText,style: TextStyle(
              fontSize: 10.sp,color: MColors.kPrimaryColor
          ),),

        ],
      ),
    );
  }
}
