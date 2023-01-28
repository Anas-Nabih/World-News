class Article {
  NewsSourceModel? source;
  String? author;
  String? title;
  String? description;
  String? sourceUrl;
  String? imageUrl;
  String? publishedAt;
  String? content;
  bool? isBookMarked;

  Article(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.sourceUrl,
        this.imageUrl,
        this.publishedAt,
        this.content,
        this.isBookMarked = false
        });

  Article.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? new NewsSourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    sourceUrl = json['url'];
    imageUrl = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
    isBookMarked = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.sourceUrl;
    data['urlToImage'] = this.imageUrl;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class NewsSourceModel {
  String? id;
  String? name;

  NewsSourceModel({this.id, this.name});

  NewsSourceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}