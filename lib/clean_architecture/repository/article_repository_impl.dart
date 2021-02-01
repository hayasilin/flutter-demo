import 'package:flutter_app/clean_architecture/core/data/article_repository.dart';
import 'package:flutter_app/clean_architecture/core/domain/article_domain.dart';
import 'package:flutter_app/clean_architecture/dto/article_dto.dart';
import 'package:flutter_app/clean_architecture/network/api_service.dart';
import 'package:flutter_app/model/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ApiService apiService;

  ArticleRepositoryImpl(this.apiService);

  @override
  Future<List<ArticleDomain>> fetchArticles() async {
    List<ArticleDto> articleDtos = await apiService.fetchArticles();
    return articleDtos.map(_toArticleDomain).toList();
  }

  ArticleDomain _toArticleDomain(ArticleDto articleDto) =>
      ArticleDomain(title: articleDto.title,
          author: articleDto.author,
          url: articleDto.url,
          imageUrl: articleDto.imageList.first);
}