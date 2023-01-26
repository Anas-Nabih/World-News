import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/models/articles_model.dart';
import 'package:world_news/ui/search/search_presenter.dart';
import 'package:world_news/ui/search/search_provider.dart';
import 'package:world_news/widgets/search_news_list.dart';
import 'package:world_news/widgets/search_place_holder.dart';
import 'package:world_news/widgets/search_screen_app_bar.dart';
import 'package:world_news/widgets/total_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.isFromHome = false}) : super(key: key);
  final bool isFromHome;

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends BaseState<SearchScreen, SearchPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final searchProvider = SearchProvider<Articles>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider<Articles>>(
        create: (context) => searchProvider,
        child: Consumer<SearchProvider<Articles>>(
            builder: (context, value, child) => SafeArea(
                  child: Scaffold(
                    body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          SearchScreeAppBar(
                              isFromHome: widget.isFromHome,
                              presenter: mPresenter),
                          SizedBox(height: 2.h),
                          searchProvider.list.isNotEmpty
                              ? TotalResult(result:searchProvider.list[0]!.totalResults!) : SizedBox(),
                          SizedBox(height: 2.h),
                          searchProvider.list.isNotEmpty
                              ? SearchNewsList(searchProvider: searchProvider)
                              : SearchPlaceHolder(
                                  text: S.of(context).lookForWhatYouAreThinking,
                                )
                        ],
                      ),
                    ),
                  ),
                )));
  }

  @override
  createPresenter() {
    return SearchPresenter();
  }

  @override
  bool get wantKeepAlive => false;
}
