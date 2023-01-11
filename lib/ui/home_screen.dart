import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_news/models/article_model.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/res/colors.dart';
 import 'package:world_news/services/news_api.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/custom_text_field.dart';
import 'package:world_news/widgets/filter_list.dart';
import 'package:world_news/widgets/headline.dart';
import 'package:world_news/widgets/home_screen_app_bar.dart';
import 'package:world_news/widgets/news_item.dart';
import 'package:world_news/widgets/news_list.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
          child: Column(
            children:  [
              const HomeScreenAppBar(),
              const HeadLine(prefixText: "News", suffixText:"See all"),
              const FilterList(),
              SizedBox(height: 2.h,),
              NewsList(articles: articlesList,)
            ],
          ),
        ),
      ),
    );
  }
}











