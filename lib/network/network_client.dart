import 'dart:async';
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
}