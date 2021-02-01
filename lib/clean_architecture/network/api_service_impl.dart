import 'dart:convert';

import 'package:flutter_app/clean_architecture/dto/article_dto.dart';
import 'package:flutter_app/clean_architecture/network/api_service.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl implements ApiService {

  Future<List<ArticleDto>> fetchArticles() async {
    String articleUrl = "https://disp.cc/api/hot_text.json";
    final response = await http.get(articleUrl);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final data = jsonDecode(utf8decoder.convert(response.bodyBytes));
      final List<dynamic> list = data['list'];
      return list.map<ArticleDto>((json) => ArticleDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}