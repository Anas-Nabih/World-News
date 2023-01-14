import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/res/colors.dart';
import 'package:world_news/ui/search/search_presenter.dart';
import 'package:world_news/ui/search/search_provider.dart';
import 'package:world_news/widgets/arrow_back.dart';
import 'package:world_news/widgets/custom_icon.dart';
import 'package:world_news/widgets/custom_text_field.dart';
import 'package:world_news/widgets/search_screen_app_bar.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends BaseState<SearchScreen, SearchPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final searchProvider = SearchProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => searchProvider,
        child: Consumer(builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: ListView(
                children: [
                 const SearchScreeAppBar(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Text(S.of(context).lookForWhatYouAreThinking,style: TextStyle(
                      fontSize: 14.sp,color: MColors.kPrimaryColor
                    ),),
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


