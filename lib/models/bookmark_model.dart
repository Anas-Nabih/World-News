class BookMarkModel {
  Source? newsId;
  Source? source;
  String? author;
  String? title;
  String? description;
  String? sourceUrl;
  String? imageUrl;
  String? publishedAt;
  String? content;

  BookMarkModel(
      {this.newsId,
      this.source,
        this.author,
        this.title,
        this.description,
        this.sourceUrl,
        this.imageUrl,
        this.publishedAt,
        this.content});

  BookMarkModel.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    source = json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    sourceUrl = json['url'];
    imageUrl = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['newsId'] = this.newsId;
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.sourceUrl;
    data['urlToImage'] = this.imageUrl;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }

  static List<BookMarkModel> bookMarksFromSnapShot(List newSnapShot){
    return newSnapShot.map((data) => BookMarkModel.fromJson(data)).toList();
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
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