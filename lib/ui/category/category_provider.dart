import 'package:world_news/base/provider/base_list_provider.dart';

class CategoryProvider<T> extends BaseListProvider<T>{
  String _countryCode = "EG";

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  bool _loadingArticles = false;

  bool get loadingArticles => _loadingArticles;

  set loadingArticles(bool value) {
    _loadingArticles = value;

    notifyListeners();
  }
}