import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/models/articles_model.dart';

class NewsApi {
  static Future<List<Article>?> fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse("https://newsapi.org"
          "/v2/top-headlines?country=us&apiKey=${Const.apiKey}"));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList = articles.articles!;
        return articlesList;
      } else {
        print("status code: ${response.statusCode}");
      }
    } catch (e) {
      print("some thing wrong happened ${e.toString()}");
    }
  }

  static Future<List<Article>?> fetchArticlesByCategory(String category) async {
    try {
      http.Response response = await http.get(Uri.parse("https://newsapi.org"
          "/v2/top-headlines?country=eg&category=$category&apiKey=${Const.apiKey}"));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList = articles.articles!;
        return articlesList;
      } else {
        print("status code: ${response.statusCode}");
      }
    } catch (e) {
      print("some thing wrong happened ${e.toString()}");
    }
  }
}
