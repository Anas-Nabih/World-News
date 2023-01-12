import 'package:world_news/base/provider/base_list_provider.dart';

class HomeProvider<T> extends BaseListProvider<T>{
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