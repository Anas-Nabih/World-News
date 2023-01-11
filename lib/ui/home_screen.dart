import 'package:flutter/material.dart';
import 'package:world_news/models/article_model.dart';
 import 'package:world_news/services/news_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articlesList = [];

  @override
  void initState(){
    NewsApi.fetchData().then((articles) => articlesList = articles!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder
        (itemCount:articlesList.length,itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          height: 20,width: 20,
      child: Text(articlesList[index].title!),
      color: Colors.red),),
    );
  }
}
