import 'dart:async';

import 'package:flutter_app/clean_architecture/core/domain/article_domain.dart';
import 'package:flutter_app/clean_architecture/core/usecase/get_articles_use_case.dart';
import 'package:flutter_app/clean_architecture/presentation/article_view_model.dart';

class HomeBloc {
  StreamController _articleStreamController = StreamController<List<ArticleViewModel>>();

  Stream<List<ArticleViewModel>> get articleResults => _articleStreamController.stream;

  final GetArticlesUseCase getArticleUseCase;

  HomeBloc(this.getArticleUseCase);

  void getArticles() async {
    List<ArticleDomain> articles = await getArticleUseCase.invoke();
    List<ArticleViewModel> articleViewModels = articles.map(_toArticleViewModel).toList();
    _articleStreamController.sink.add(articleViewModels);
  }

  void dispose() {
    _articleStreamController.close();
  }

  ArticleViewModel _toArticleViewModel(ArticleDomain articleDomain) =>
      ArticleViewModel(title: articleDomain.title,
          author: articleDomain.author,
          url: articleDomain.url,
          imageUrl: articleDomain.imageUrl);
}