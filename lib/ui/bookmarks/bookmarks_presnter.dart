import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/models/bookmark_model.dart';
import 'package:world_news/ui/bookmarks/bookmarks_screen.dart';

class BookMarksPresenter extends BasePresenter<BookMarksScreenState> {
  CollectionReference bookMarks =
      FirebaseFirestore.instance.collection(Const.bookmarks);

  Future<void> getBookMarks() async {

    QuerySnapshot querySnapshot = await bookMarks.get();
    view.bookMarksProvider.clear();
    for (var doc in querySnapshot.docs) {
      view.bookMarksProvider.list.add(BookMarkModel.fromJson(doc));
    }
    view.bookMarksProvider.dataLoaded = true;
  }
}
