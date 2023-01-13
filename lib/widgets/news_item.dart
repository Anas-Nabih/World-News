import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/image_loader.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/news_details/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    required this.article,
    Key? key,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailsScreen(article: article),
          )),
      child: Container(
        height: 25.h,
        margin: EdgeInsets.only(bottom: 2.h, right: 2.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(3, 2),
                  spreadRadius: 1,
                  blurRadius: 2),
            ]),
        child: Row(
          children: [
            Container(
              height: 25.h,
              width: 35.w,
              decoration: BoxDecoration(
                color: MColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ImageLoader.loadCachedNetworkImage(article!.imageUrl ?? ""),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      article.title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      article?.content ?? article?.description ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 9.sp, color: Colors.black.withOpacity(.6)),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 18.w,
                        child: Text(
                          Utils.formatApiDate(article.publishedAt!),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: MColors.kPrimaryColor),
                        ),
                      ),
                      SizedBox(width: 24.w),
                      SizedBox(
                        width: 10.w,
                        child: Text(
                          article.source!.name!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: MColors.kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
