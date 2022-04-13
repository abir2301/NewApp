import 'dart:convert';

import 'package:app/models/article_model.dart';
import 'package:app/models/articles_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String apikey = '7ba8b5787080427ba35c240dd07148a1';
  Future<List<Article>?> fetchArticles() async {
    try {
      http.Response? response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2022-03-12&sortBy=publishedAt&apiKey=$apikey'));
      if (response.statusCode == 200) {
        String? data = response.body;
        var jsonData = jsonDecode(data);
        Articles? articles = Articles.fromJson(jsonData);
        List<Article>? articleList =
            articles.articles!.map((e) => Article.fromJson(e)).toList();
        return articleList;
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
