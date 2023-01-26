import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_news/common_utils/preferences/const.dart';
import 'package:world_news/models/article_model.dart';
import 'package:world_news/models/articles_model.dart';

class NewsApi {
  static Future<List<Article>?> fetchArticles(
      {required String countryCode}) async {
    try {
      debugPrint("country code from api:$countryCode");
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=${Const.apiKey}"));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList = articles.articles!;
        return articlesList;
      } else {
        debugPrint("status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("some thing wrong happened ${e.toString()}");
    }
    // Prefs.getCountryCode.then((countryCode) async{
    //   debugPrint("focus here: $countryCode");
    //   try {
    //     http.Response response = await http.get(Uri.parse("https://newsapi.org"
    //         "/v2/top-headlines?country=eg&apiKey=${Const.apiKey}"));
    //     if (response.statusCode == 200) {
    //       String data = response.body;
    //       var jsonData = jsonDecode(data);
    //       Articles articles = Articles.fromJson(jsonData);
    //       List<Article> articlesList = articles.articles!;
    //       return articlesList;
    //     } else {
    //       print("status code: ${response.statusCode}");
    //     }
    //   } catch (e) {
    //     print("some thing wrong happened ${e.toString()}");
    //   }
    // });
  }

  static Future<List<Article>?> fetchArticlesByCategory(
      {required String category, required String countryCode}) async {
    try {
      http.Response response = await http.get(Uri.parse("https://newsapi.org"
          "/v2/top-headlines?country=$countryCode&category=$category&apiKey=${Const.apiKey}"));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Article> articlesList = articles.articles!;
        return articlesList;
      } else {
        debugPrint("status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("some thing wrong happened ${e.toString()}");
    }
  }

  static Future<List<Articles>?> search({required String searchKeyWord}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=$searchKeyWord&apiKey=${Const.apiKey}"));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Articles articles = Articles.fromJson(jsonData);
        List<Articles> articlesList = [];
        articlesList.add(articles);
        return articlesList;
      } else {
        debugPrint("status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("some thing wrong happened ${e.toString()}");
    }
  }
}
