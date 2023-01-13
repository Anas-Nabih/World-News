import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ParagraphWithHeadline extends StatelessWidget {
  const ParagraphWithHeadline({
    Key? key,
    required this.headLine,
    required this.paragraph,
  }) : super(key: key);

  final String paragraph;
  final String headLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2.h),
        Text(
          headLine,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 1.h),
        Text(paragraph),
      ],
    );
  }
}