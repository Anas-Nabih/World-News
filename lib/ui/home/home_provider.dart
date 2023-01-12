import 'package:world_news/base/provider/base_list_provider.dart';

class HomeProvider<T> extends BaseListProvider<T>{

  bool _loadingArticles = false;

  bool get loadingArticles => _loadingArticles;

  set loadingArticles(bool value) {
    _loadingArticles = value;

    notifyListeners();
    print("Provider statues from provider class: ${loadingArticles}");
  }

  final List<String> categories = [
    "general",
    "technology",
    "business",
    "science",
    "sports",
    "health",
    "entertainment",
  ];
}