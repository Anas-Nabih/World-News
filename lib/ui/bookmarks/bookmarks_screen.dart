import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/base/view/base_state.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/generated/l10n.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/models/bookmark_model.dart';
import 'package:world_news/ui/bookmarks/bookmarks_presnter.dart';
import 'package:world_news/ui/bookmarks/bookmarks_provider.dart';
import 'package:world_news/widgets/news_item.dart';
import 'package:world_news/widgets/news_shimmer.dart';
import 'package:world_news/widgets/screen_app_bar.dart';
import 'package:sizer/sizer.dart';

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
    debugPrint("provider length: ${bookMarksProvider.list.length}");
    return ChangeNotifierProvider<BookMarksProvider<BookMarkModel>>(
      create: (context) => bookMarksProvider,
      child: Consumer<BookMarksProvider<BookMarkModel>>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                ScreenAppBar(
                  title: S.of(context).bookmarks,
                  isFromHome: true,
                ),
                bookMarksProvider.list.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(right: 3.w,left:
                          3.w,top: 1.h),
                        itemCount: bookMarksProvider.list.length,
                        itemBuilder: (context, index) => NewsItem(
                            article: Article(
                          title: bookMarksProvider.list[index].title,
                          description:
                              bookMarksProvider.list[index].description,
                          content: bookMarksProvider.list[index].content,
                          author: bookMarksProvider.list[index].author,
                          imageUrl: bookMarksProvider.list[index].imageUrl,
                          sourceUrl: bookMarksProvider.list[index].sourceUrl,
                          publishedAt:
                              bookMarksProvider.list[index].publishedAt,
                          source: NewsSourceModel(
                              name: bookMarksProvider.list[index].source,
                              id: ""),
                        )),
                      ))
                    : const NewsShimmer()
              ],
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
