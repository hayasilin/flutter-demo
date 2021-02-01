import 'package:flutter_app/clean_architecture/core/domain/article_domain.dart';

abstract class ArticleRepository {
  Future<List<ArticleDomain>> fetchArticles();
}