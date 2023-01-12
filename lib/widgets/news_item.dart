import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/res/colors.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    required this.article,
    Key? key,
  }) : super(key: key);

  final Article article;

  String dateFormatter(String date) {
    final dateFormate = DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
    return dateFormate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                errorWidget: (context, url,error) => FlutterLogo(),
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl:article!.imageUrl ?? "",
                fit: BoxFit.cover,
              ),
            ) ,
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
                    style: TextStyle(fontSize: 9.sp,color: Colors.black.withOpacity(.6)),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 18.w,
                      child: Text(
                        dateFormatter(article.publishedAt!),
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
    );
  }
}
