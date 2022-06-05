class MediumBlogModel {
  MediumBlogModel({
    required this.status,
    required this.feed,
    required this.items,
  });
  late final String status;
  late final Feed feed;
  late final List<Items> items;

  MediumBlogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    feed = Feed.fromJson(json['feed']);
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['feed'] = feed.toJson();
    data['items'] = items.map((e) => e.toJson()).toList();
    return data;
  }
}

class Feed {
  Feed({
    required this.url,
    required this.title,
    required this.link,
    required this.author,
    required this.description,
    required this.image,
  });
  late final String url;
  late final String title;
  late final String link;
  late final String author;
  late final String description;
  late final String image;

  Feed.fromJson(Map<String, dynamic> json) {
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

class Items {
  Items({
    required this.title,
    required this.pubDate,
    required this.link,
    required this.guid,
    required this.author,
    required this.thumbnail,
    required this.description,
    required this.content,
    required this.enclosure,
    required this.categories,
  });
  late final String title;
  late final String pubDate;
  late final String link;
  late final String guid;
  late final String author;
  late final String thumbnail;
  late final String description;
  late final String content;
  late final Enclosure enclosure;
  late final List<String> categories;

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pubDate = json['pubDate'];
    link = json['link'];
    guid = json['guid'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    content = json['content'];
    enclosure = Enclosure.fromJson(json['enclosure']);
    categories = List.castFrom<dynamic, String>(json['categories']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['pubDate'] = pubDate;
    data['link'] = link;
    data['guid'] = guid;
    data['author'] = author;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    data['content'] = content;
    data['enclosure'] = enclosure.toJson();
    data['categories'] = categories;
    return data;
  }
}

class Enclosure {
  Enclosure();

  Enclosure.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
