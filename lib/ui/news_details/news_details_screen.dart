import 'package:flutter/material.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/ui/news_details/news_details_presenter.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/widgets/news_details.dart';
import 'package:world_news/widgets/news_details_app_bar.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({required this.article,Key? key}) : super(key: key);

  final Article article;

  @override
  State<NewsDetailsScreen> createState() => NewsDetailsScreenState();
}

class NewsDetailsScreenState extends BaseState<NewsDetailsScreen,NewsDetailsPresenter>
with AutomaticKeepAliveClientMixin,TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical:2.h),
          child: Column(
            children: [
             const NewsDetailsAppBar(),
              NewsDetails(article: widget.article),
            ],
          ),
        ),

      ),
    );
  }

  @override
  NewsDetailsPresenter createPresenter() {
    return NewsDetailsPresenter();
  }

  @override
   bool get wantKeepAlive => false;
}
