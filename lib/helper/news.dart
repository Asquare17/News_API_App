import 'dart:convert';

import 'package:news_api/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=f34a971b04f6412aaf0655956268448e';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'] == null
                  ? DateTime.now()
                  : DateTime.parse(element['publishedAt']));
          news.add(articleModel);
        }
      });
    }
  }
}

class CategorysNews {
  List<ArticleModel> categoryNews = [];
  Future<void> getNews({String category}) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f34a971b04f6412aaf0655956268448e';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              content: element['content'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'] == null
                  ? DateTime.now()
                  : DateTime.parse(element['publishedAt']));
          categoryNews.add(articleModel);
        }
      });
    }
  }
}
