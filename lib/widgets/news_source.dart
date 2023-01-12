import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/res/colors.dart';

class NewsSource extends StatelessWidget {
  const NewsSource({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: "${article.source!.name} - ",
                style: TextStyle(
                    color: MColors.kPrimaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: article.author,
                    style: TextStyle(
                        color: MColors.kPrimaryColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
          Spacer(),
          Text(
            "2023-1-12",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
