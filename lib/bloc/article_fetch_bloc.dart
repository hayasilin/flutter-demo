import 'package:bloc/bloc.dart';
import 'package:flutter_app/bloc/api_repository.dart';
import 'package:flutter_app/bloc/bloc_data_loading_state.dart';
import 'package:flutter_app/bloc/bloc_event.dart';
import 'package:flutter_app/clean_architecture/core/domain/article_domain.dart';
import 'package:flutter_app/clean_architecture/dto/article_dto.dart';
import 'package:flutter_app/clean_architecture/presentation/article_view_model.dart';

class ArticleFetchBloc extends Bloc<ArticleRequestEvent, ArticleFetchState> {
  ArticleFetchBloc(this._apiRepository);

  final ApiRepository _apiRepository;

  @override
  ArticleFetchState get initialState => ArticleFetchState.loading();

  @override
  Stream<ArticleFetchState> mapEventToState(ArticleRequestEvent event) async* {
    yield const ArticleFetchState.loading();
    try {
      List<ArticleDto> articles = await _apiRepository.fetchArticleList();
      List<ArticleDomain> articleDomains = articles.map(_toArticleDomain).toList();
      List<ArticleViewModel> articleViewModels = articleDomains.map(_toArticleViewModel).toList();
      yield ArticleFetchState.success(articleViewModels);
    } on Exception catch (error) {
      yield ArticleFetchState.error(error);
    }
  }

  ArticleDomain _toArticleDomain(ArticleDto articleDto) =>
      ArticleDomain(title: articleDto.title,
          author: articleDto.author,
          url: articleDto.url,
          imageUrl: articleDto.imageList.first);

  ArticleViewModel _toArticleViewModel(ArticleDomain articleDomain) =>
      ArticleViewModel(title: articleDomain.title,
          author: articleDomain.author,
          url: articleDomain.url,
          imageUrl: articleDomain.imageUrl);
}

///
/// [ArticleFetchBloc] will be notified when content needs to be reloaded.
///
class ArticleRequestEvent extends BlocEvent {
  const ArticleRequestEvent();
}

///
/// The output of a Bloc. Presentation components can listen to the stream of states and
/// redraw portions of themselves based on the given state.
///
class ArticleFetchState extends BlocDataLoadingState<List<ArticleViewModel>> {
  const ArticleFetchState.loading() : super(isLoading: true);

  const ArticleFetchState.success(List<ArticleViewModel> articleList) : super(data: articleList);

  const ArticleFetchState.error(Object error) : super(error: error);
}