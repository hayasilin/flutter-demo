import 'package:flutter_app/clean_architecture/dto/article_dto.dart';

abstract class ApiService {
  Future<List<ArticleDto>> fetchArticles();
}