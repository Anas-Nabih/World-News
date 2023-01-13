import 'package:world_news/base/provider/base_list_provider.dart';

class HomeProvider<T> extends BaseListProvider<T> {
  bool _loadingArticles = false;

  bool get loadingArticles => _loadingArticles;

  set loadingArticles(bool value) {
    _loadingArticles = value;

    notifyListeners();
    print("Provider statues from provider class: ${loadingArticles}");
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
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
