import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/widgets/news_source.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({required this.article, Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.red),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => FlutterLogo(),
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              imageUrl: article!.imageUrl ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  article.title!,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
                NewsSource(article: article),
                ParagraphWithHeadline(
                    headLine: "Description", paragraph: article.description!),
                ParagraphWithHeadline(
                    headLine: "Content", paragraph: article.content!),
              ],
            ),
          ),
        )
      ],
    );
  }
}

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
