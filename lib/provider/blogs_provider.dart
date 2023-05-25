import 'package:flutter/cupertino.dart';
import 'package:AshuTech/controller/blog_api.dart';
import 'package:AshuTech/models/medium_blog_model.dart';

class BlogProvider with ChangeNotifier {
  List<Items>? _blogList = [];

  List<Items>? getBlogList() => _blogList;

  Future quickUpdateBlogFeed() async {
    await BlogApi.getBlogList().then((value) {
      _blogList = value;
      notifyListeners();
    });
  }
}
