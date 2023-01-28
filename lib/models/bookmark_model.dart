// class BookMarkModel {
//   String? source;
//   String? newsId;
//   String? author;
//   String? title;
//   String? description;
//   String? sourceUrl;
//   String? imageUrl;
//   String? publishedAt;
//   String? content;
//
//   BookMarkModel(
//       {this.newsId,
//       this.source,
//         this.author,
//         this.title,
//         this.description,
//         this.sourceUrl,
//         this.imageUrl,
//         this.publishedAt,
//         this.content});
//
//   BookMarkModel.fromJson(json) {
//     newsId = json['newsId'] ?? "";
//     source = json['source'] ?? "";
//     author = json['author'] ?? "";
//     title = json['title']?? "";
//     description = json['description']?? "";
//     sourceUrl = json['url']?? "";
//     imageUrl = json['urlToImage']?? "";
//     publishedAt = json['publishedAt']?? "";
//     content = json['content']?? "";
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     data['source'] = this.source;
//     data['newsId'] = this.newsId;
//     data['author'] = this.author;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['url'] = this.sourceUrl;
//     data['urlToImage'] = this.imageUrl;
//     data['publishedAt'] = this.publishedAt;
//     data['content'] = this.content;
//     return data;
//   }
//
//   static List<BookMarkModel> bookMarksFromSnapShot(List newSnapShot){
//     return newSnapShot.map((data) => BookMarkModel.fromJson(data)).toList();
//   }
// }

import 'package:flutter/foundation.dart';

class BookMarkModel {
  String? author;
  String? content;
  String? description;
  String? imageUrl;
  String? newsId;
  String? publishedAt;
  String? source;
  String? sourceUrl;
  String? title;

  BookMarkModel(
      {this.author,
        this.content,
        this.description,
        this.imageUrl,
        this.newsId,
        this.publishedAt,
        this.source,
        this.sourceUrl,
        this.title});

  BookMarkModel.fromJson(json) {
    author = json['author'];
    content = json['content'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    newsId = json['newsId'];
    publishedAt = json['publishedAt'];
    source = json['source'];
    sourceUrl = json['sourceUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['content'] = this.content;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['newsId'] = this.newsId;
    data['publishedAt'] = this.publishedAt;
    data['source'] = this.source;
    data['sourceUrl'] = this.sourceUrl;
    data['title'] = this.title;
    return data;
  }
}
