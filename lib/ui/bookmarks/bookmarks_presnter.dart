import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/models/bookmark_model.dart';
import 'package:world_news/ui/bookmarks/bookmarks_screen.dart';

class BookMarksPresenter extends BasePresenter<BookMarksScreenState> {
  CollectionReference bookMarks =
      FirebaseFirestore.instance.collection(Const.bookmarks);

  Future<void> getBookMarks() async {

    QuerySnapshot querySnapshot = await bookMarks.get();
    view.bookMarksProvider.list.clear();
    view.bookMarksProvider.docsId.clear();
    for (var doc in querySnapshot.docs) {
      view.bookMarksProvider.docsId.add(doc.id);
      view.bookMarksProvider.list.add(BookMarkModel.fromJson(doc));
      debugPrint("docs id: ${view.bookMarksProvider.docsId}");
    }
    view.bookMarksProvider.dataLoaded = true;
  }

}
