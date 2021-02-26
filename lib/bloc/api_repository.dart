import 'package:flutter_app/clean_architecture/dto/article_dto.dart';
import 'package:flutter_app/clean_architecture/network/api_service.dart';

class ApiRepository {
  const ApiRepository(this._apiService);

  final ApiService _apiService;

  Future<List<ArticleDto>> fetchArticleList() async {
    return _apiService.fetchArticles();
  }
}