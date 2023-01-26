import 'package:world_news/base/presenter/base_presenter.dart';
import 'package:world_news/services/news_api.dart';
import 'package:world_news/ui/search/search_screen.dart';

class SearchPresenter extends BasePresenter<SearchScreenState>{

  search({required String searchKeyWord}){
    print("object hey: $searchKeyWord");
    NewsApi.search(searchKeyWord: searchKeyWord).then((value){
      view.searchProvider.clear();
      view.searchProvider.addAll(value!);
    });
  }
}