import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/model/album.dart';
import 'package:flutter_app/model/article.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  static const userBaseUrl = "https://jsonplaceholder.typicode.com";
  static const articleUrl = "https://disp.cc/api/hot_text.json";

  static Future getUsers() {
    var url = userBaseUrl + "/users";
    return http.get(url);
  }

  static Future getArticles() {
    return http.get(articleUrl);
  }

  static Future<List<Article>> fetchArticles() async {
    final response = await http.get(articleUrl);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final data = jsonDecode(utf8decoder.convert(response.bodyBytes));
      final list = data['list'];
      return list.map<Article>((json) => Article.fromJSON(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  static Future<Album> fetchAlbum() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load alum');
    }
  }
}
