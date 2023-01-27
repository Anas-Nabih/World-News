import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/common_utils/utils.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/services/news_api.dart';
import 'package:world_news/ui/home/home_screen.dart';

class HomePresenter extends BasePresenter<HomeScreenState> {
  CollectionReference bookMarks =
      FirebaseFirestore.instance.collection(Const.bookmarks);

  addToBookMarks({required Article article}) {
    bookMarks.add({
      "newsId":"",
        "title": article.title,
        "sourceUrl": article.sourceUrl,
        "imageUrl": article.sourceUrl,
        "author": article.author,
        "content": article.content,
        "description": article.description,
        "publishedAt": Utils.formatApiDate(article.publishedAt!),
        "source": article.source!.name});
  }

  removeFromBookMarks(Article article) {}

  getHomeNews({required String countryCode}) {
    NewsApi.fetchArticles(countryCode: countryCode).then((value) {
      view.articlesList = value!;
      view.provider.loadingArticles = true;
    });
  }

  getHomeNewsByCategory({required String category}) {
    NewsApi.fetchArticlesByCategory(
            countryCode: view.provider.countryCode, category: category)
        .then((value) {
      view.articlesList = value!;
      view.provider.loadingArticles = true;
    });
  }
}
