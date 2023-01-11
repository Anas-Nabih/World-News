import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_news/models/article_model.dart';
import 'package:world_news/models/articles_model.dart';
class NewsApi{

 static Future<List<Article>?> fetchData()async{
    try{
     http.Response response = await http.get(Uri.parse("https://newsapi.org"
         "/v2/top-headlines?country=us&apiKey=1d4bccd55c6e4b30b7dc390dc3da42c1"));
     if (response.statusCode == 200){
       String data = response.body;
        var jsonData = jsonDecode(data);
       Articles articles = Articles.fromJson(jsonData);
       List<Article> articlesList = articles.articles!;
       return articlesList;
      }else{
       print("status code: ${response.statusCode}");
     }
    }catch(e){
      print("some thing wrong happened ${e.toString()}");
    }
  }
}