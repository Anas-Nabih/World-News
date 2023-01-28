
import 'package:world_news/base/provider/base_list_provider.dart';

class BookMarksProvider <T> extends BaseListProvider<T>{

  bool _dataLoaded = false;

  bool get dataLoaded => _dataLoaded;

  set dataLoaded(bool value) {
    _dataLoaded = value;
    notifyListeners();
  }

  List<String> _docsId = [];

  List<String> get docsId => _docsId;

  set docsId(List<String> value) {
    _docsId = value;
    notifyListeners();
  }
}