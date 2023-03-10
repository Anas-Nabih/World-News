 import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/utils.dart';
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
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: RichText(
              text: TextSpan(
                  text: "${article.source!.name} - ",
                  style: Theme.of(context).textTheme.headline4,
                  children: [
                    TextSpan(
                      text: article.author,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ]),
            ),
          ),
          const Spacer(),
          Text(
            Utils.formatApiDate(article.publishedAt!),
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
