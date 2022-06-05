// ignore: file_names
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:personal_portfolio/models/medium_blog_model.dart';
import 'package:personal_portfolio/utils/constant.dart';

class BlogApi {
  static Future<List<Items>> getBlogList() async {
    List<Items> item = [];
    try {
      final http.Response response = await http.get(Uri.parse(mediumBlogUrl));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final feedData = MediumBlogModel.fromJson(json);
        item = feedData.items;
        return item;
      }
    } catch (e) {
      dev.log(e.toString());
    }
    return item;
  }
}
