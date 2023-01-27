import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(2, 3))
          ]),
      child: SizedBox(
        height: 4.h,
        width: 4.h,
        child: const CircularProgressIndicator(
          color: MColors.kPrimaryColor,
        ),
      ),
    );
  }
}
