import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/models/article_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    required this.article,
    Key? key,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      margin: EdgeInsets.only(bottom: 2.h,right: 2.w),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2),
          offset: Offset(3,2),
            spreadRadius: 1,
            blurRadius: 2

          ),
        ]
      ),
      child: Row(
        children: [
          Container(
            height: 25.h,
            width: 35.w,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(
            width: 50.w,
            child: Text(article.title!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              ),
          )
        ],
      ),
    );
  }
}