import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/common_utils/preferences/Prefs.dart';
import 'package:world_news/services/news_api.dart';
import 'package:world_news/ui/home/home_screen.dart';

class HomePresenter extends BasePresenter<HomeScreenState> {


  getHomeNews(){
     NewsApi.fetchArticles(countryCode:view.provider.countryCode).then((value) {
      view.articlesList = value!;
      view.provider.loadingArticles = true;
    });
  }

  getHomeNewsByCategory({required String category}){
     NewsApi.fetchArticlesByCategory(countryCode: view.provider.countryCode,category: category).then((value) {
      view.articlesList = value!;
      view.provider.loadingArticles = true;
    });
  }
}