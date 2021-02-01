
import 'package:flutter_app/clean_architecture/core/data/article_repository.dart';
import 'package:flutter_app/clean_architecture/core/domain/article_domain.dart';

class GetArticlesUseCase {
  final ArticleRepository articleRepository;

  GetArticlesUseCase(this.articleRepository);

  Future<List<ArticleDomain>> invoke() => articleRepository.fetchArticles();
}