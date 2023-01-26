
import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/services/news_api.dart';
import 'package:world_news/ui/category/category_screen.dart';

class CategoryPresenter extends BasePresenter<CategoryScreenState>{

  getNewsByCategory({required String category}) {
    NewsApi.fetchArticlesByCategory(
        countryCode: view.categoryProvider.countryCode, category: category)
        .then((value) {
      view.categoryProvider.list.addAll(value!);
      view.categoryProvider.loadingArticles = true;
    });
  }
}