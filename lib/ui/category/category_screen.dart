import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/ui/category/category_provider.dart';
import 'package:world_news/ui/category/category_presenter.dart';
import 'package:world_news/widgets/news_list.dart';
import 'package:world_news/widgets/news_shimmer.dart';
import 'package:world_news/widgets/screen_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.title,required this.category}) : super(key: key);
  final String title;
  final String category;

  @override
  State<CategoryScreen> createState() => CategoryScreenState();
}

class CategoryScreenState extends BaseState<CategoryScreen, CategoryPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final CategoryProvider<Article> categoryProvider =
      CategoryProvider<Article>();

  @override
  void initState() {
    Prefs.getCountryCode.then((value) => {
          debugPrint("countryCode status: $value"),
          categoryProvider.countryCode = value,
          mPresenter.getNewsByCategory(category: widget.category)
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ChangeNotifierProvider<CategoryProvider<Article>>(
        create: (context) => categoryProvider,
        child: Consumer<CategoryProvider<Article>>(
          builder: (context, value, child) => Padding(
            padding:
                EdgeInsets.only(top: 0.h, bottom: 1.h, right: 3.w, left: 3.w),
            child: Column(
              children: [
                ScreenAppBar(title: widget.title),
                SizedBox(
                  height: 2.h,
                ),
                categoryProvider.loadingArticles
                    ? NewsList(articles: categoryProvider.list)
                    : const NewsShimmer(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  @override
  createPresenter() {
    return CategoryPresenter();
  }

  @override
  bool get wantKeepAlive => false;
}
