import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,required this.onTapped
  }) : super(key: key);

  final void Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 7.h,
        width: double.infinity,
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              colors: [Color(0xffff827d), MColors.kPrimaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Center(
            child: Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
            )),
      ),
    );
  }
}