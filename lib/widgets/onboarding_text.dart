import 'package:flutter/material.dart';
import 'package:world_news/res/colors.dart';
import 'package:sizer/sizer.dart';

class OnBoardingText extends StatefulWidget {
  const OnBoardingText({Key? key,required this.text,required this.focusText}) : super(key: key);
  final String text;
  final String focusText;

  @override
  State<OnBoardingText> createState() => _OnBoardingTextState();
}

class _OnBoardingTextState extends State<OnBoardingText> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: widget.text,
        style:
        TextStyle(color: Colors.white, fontSize: 22.sp),
        children: [
          TextSpan(
              text:widget.focusText,
              style: TextStyle(
                  color: MColors.kPrimaryColor,
                  fontSize: 22.sp))
        ]));
  }
}
