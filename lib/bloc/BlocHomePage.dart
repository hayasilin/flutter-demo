import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/api_repository.dart';
import 'package:flutter_app/bloc/article_fetch_bloc.dart';
import 'package:flutter_app/bloc/bloc_article_list_view.dart';
import 'package:flutter_app/clean_architecture/presentation/article_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BlocHomePage extends StatefulWidget {
  BlocHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BlocHomePageState createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  ArticleFetchBloc _articleFetchBloc;

  @override
  void initState() {
    super.initState();
    final ApiRepository apiRepository = Provider.of<ApiRepository>(context, listen: false);
    _articleFetchBloc = ArticleFetchBloc(apiRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _articleFetchBloc),
        ],
        child: StatefulBuilder(
          builder: (_, statefulBuilderSetState) => FutureBuilder<ConnectivityResult>(
            future: Connectivity().checkConnectivity(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // If the connection is on or no connection result, we build the home module widget.
              return _buildArticleListView();
            },
          )
        ),
      ),
    );
  }

  Widget _buildArticleListView({
    @required List<ArticleViewModel> articleViewModels,
  }) {
    _articleFetchBloc.add(const ArticleRequestEvent());
    return BlocArticleListView();
  }
}
