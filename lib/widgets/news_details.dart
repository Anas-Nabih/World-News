import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/common_utils/image_loader.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/widgets/news_source.dart';
import 'package:world_news/widgets/paragraph_with_headline.dart';

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
            child: ImageLoader.loadCachedNetworkImage(article!.imageUrl ?? ""),
          ),
        ),
        SizedBox(
          height: 50.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  article.title!,
                  style:Theme.of(context).textTheme.headline2),
                NewsSource(article: article),
                if(article.description != null)
                ParagraphWithHeadline(
                    headLine: article?.description !=null ? "Description" : "", paragraph: article.description!),
                if(article.content != null)
                ParagraphWithHeadline(
                    headLine: article?.content != null ? "Content" : "",
                    paragraph: article?.content ?? ""),
              ],
            ),
          ),
        )
      ],
    );
  }
}
