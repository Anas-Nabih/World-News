import 'package:flutter/cupertino.dart';
import 'package:world_news/base/provider/base_list_provider.dart';
import 'package:world_news/generated/l10n.dart';

class HomeProvider<T> extends BaseListProvider<T> {
  bool _loadingArticles = false;

  bool get loadingArticles => _loadingArticles;

  set loadingArticles(bool value) {
    _loadingArticles = value;

    notifyListeners();
  }

  String _countryCode = "EG";

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  List<Map<String, String>> categoriesList({required BuildContext context}) {
    return [
      {"key": "General", "value": S.of(context).general},
      {"key": "Technology", "value": S.of(context).technology},
      {"key": "Business", "value": S.of(context).business},
      {"key": "Science", "value": S.of(context).science},
      {"key": "Sports", "value": S.of(context).sports},
      {"key": "Health", "value": S.of(context).health},
      {"key": "Entertainment", "value": S.of(context).entertainment},
    ];
  }
}
