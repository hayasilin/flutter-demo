import 'dart:async';
import 'package:http/http.dart' as http;

class NetworkClient {
  static const baseUrl = "https://jsonplaceholder.typicode.com";

  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }
}