import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/res/theme/app_provider.dart';
import 'package:world_news/ui/home/home_presenter.dart';
import 'package:world_news/ui/home/home_provider.dart';
import 'package:world_news/widgets/custom_drawer.dart';
import 'package:world_news/widgets/filter_list.dart';
import 'package:world_news/widgets/headline.dart';
import 'package:world_news/widgets/home_screen_app_bar.dart';
import 'package:world_news/widgets/news_list.dart';
import 'package:world_news/widgets/news_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends BaseState<HomeScreen, HomePresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  List<Article> articlesList = [];

  final provider = HomeProvider();

  @override
  void initState() {
    mPresenter.getHomeNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => provider,
      child: Consumer<HomeProvider>(
        builder: (context, consProvider, child) => SafeArea(
          child: Scaffold(
            drawer: const CustomDrawer(),
            body: Padding(
              padding: EdgeInsets.only(right: 3.w,left: 3.w, top: 1.h),
              child: Column(
                children: [
                  const HomeScreenAppBar(),
                  HeadLine(prefixText: S.of(context).news!, suffixText: "See all"),
                  FilterList(homeProvider: provider, presenter: mPresenter),
                  SizedBox(
                    height: 2.h,
                  ),
                  provider.loadingArticles
                      ? NewsList(
                          articles: articlesList,
                        )
                      : const NewsShimmer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomePresenter createPresenter() {
    return HomePresenter();
  }

  @override
  bool get wantKeepAlive => true;
}
