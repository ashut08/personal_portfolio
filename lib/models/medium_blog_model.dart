class ArticleModel {
  ArticleModel({
    this.url,
    this.title,
    this.link,
    this.author,
    this.description,
    this.image,
    this.categories,
    this.pubDate,
    this.thumbnail,
  });
  late final String? url;
  late final String? title;
  late final String? link;
  late final String? author;
  late final String? description;
  late final String? image;
  late final String? pubDate;
  late final String? thumbnail;
  late final List<String>? categories;

  ArticleModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    link = json['link'];
    author = json['author'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['link'] = link;
    data['author'] = author;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
