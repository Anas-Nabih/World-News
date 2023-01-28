import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/models/bookmark_model.dart';
import 'package:world_news/ui/bookmarks/bookmarks_presnter.dart';
import 'package:world_news/ui/bookmarks/bookmarks_provider.dart';
import 'package:world_news/widgets/bookmarks_list.dart';
import 'package:world_news/widgets/news_shimmer.dart';
import 'package:world_news/widgets/screen_app_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/widgets/search_place_holder.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({Key? key}) : super(key: key);

  @override
  State<BookMarksScreen> createState() => BookMarksScreenState();
}

class BookMarksScreenState
    extends BaseState<BookMarksScreen, BookMarksPresenter>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final BookMarksProvider<BookMarkModel> bookMarksProvider =
      BookMarksProvider<BookMarkModel>();

  @override
  void initState() {
    mPresenter.getBookMarks();
    super.initState();
  }

  CollectionReference bookMarks =
      FirebaseFirestore.instance.collection(Const.bookmarks);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookMarksProvider<BookMarkModel>>(
      create: (context) => bookMarksProvider,
      child: Consumer<BookMarksProvider<BookMarkModel>>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: bookMarksProvider.dataLoaded ? 0.w : 3.w),
              child: Column(
                children: [
                  ScreenAppBar(
                    title: S.of(context).bookmarks,
                    isFromHome: true,
                  ),
                  bookMarksProvider.dataLoaded
                      ? bookMarksProvider.list.isNotEmpty
                          ? BookMarksList(bookMarksProvider: bookMarksProvider)
                          : Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 10.h),
                                  const CustomPlaceHolder(
                                      text: "No BookMarks Yet."),
                                ],
                              ),
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
  createPresenter() {
    return BookMarksPresenter();
  }

  @override
  bool get wantKeepAlive => false;
}
