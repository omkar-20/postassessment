import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapi/news_api.dart';

class RemoteService {
  Future<List<Article>> fetchData() async {
    final client = http.Client();
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4b4b40292b7e454888ad30be9f74ca83';
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // parse the JSON data and return it
      final json = jsonDecode(response.body);
      //print(json);
      final News news = News.fromJson(json);
      return news.articles;
    }
    return [];
  }
}
