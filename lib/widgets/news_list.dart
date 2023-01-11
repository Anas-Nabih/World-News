import 'package:flutter/material.dart';
import 'package:world_news/models/article_model.dart';
 import 'package:world_news/widgets/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({required this.articles,Key? key}) : super(key: key);
  final List<Article> articles;


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: articles.length ,
      itemBuilder: (context, index) => NewsItem(article: articles[index]),
    ));
  }
}
