import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_berita/models/article_model.dart';

class ApiService {
  final endPointurl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'id',
      'category': 'technology',
      'apiKey': '0d5782ac6ea7429a9810926c94864846'
    };

    final uri = Uri.https(endPointurl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
