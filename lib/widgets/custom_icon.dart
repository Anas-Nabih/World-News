
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    required this.icon,
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,width: 5.h,
      decoration: BoxDecoration(
          color: MColors.kPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Icon(icon,
          size: 3.h,
          color: MColors.kPrimaryColor.withOpacity(0.8)),
    );
  }
}