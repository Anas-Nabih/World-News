import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/models/bookmark_model.dart';
import 'package:world_news/ui/bookmarks/bookmarks_presnter.dart';
import 'package:world_news/ui/bookmarks/bookmarks_provider.dart';
import 'package:world_news/widgets/news_item.dart';

class BookMarksList extends StatelessWidget {
  const BookMarksList({
    Key? key,
    required this.bookMarksProvider,
    required this.presenter,
  }) : super(key: key);

  final BookMarksProvider<BookMarkModel> bookMarksProvider;
  final BookMarksPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: EdgeInsets.only(right: 3.w, left: 3.w, top: 1.h),
      itemCount: bookMarksProvider.list.length,
      itemBuilder: (context, index) => NewsItem(
          isFromBookmarksScreen: true,
          onBookMarkedTapped: (){
            presenter.getBookMarks();
          },
          docId: bookMarksProvider.docsId[index],
          article: Article(
            isBookMarked: true,
            title: bookMarksProvider.list[index].title,
            description: bookMarksProvider.list[index].description,
            content: bookMarksProvider.list[index].content,
            author: bookMarksProvider.list[index].author,
            imageUrl: bookMarksProvider.list[index].imageUrl,
            sourceUrl: bookMarksProvider.list[index].sourceUrl,
            publishedAt: bookMarksProvider.list[index].publishedAt,
            source: NewsSourceModel(
                name: bookMarksProvider.list[index].source, id: ""),
          )),
    ));
  }
}
