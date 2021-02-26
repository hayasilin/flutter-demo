import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/article_fetch_bloc.dart';
import 'package:flutter_app/clean_architecture/presentation/article_view_model.dart';
import 'package:flutter_app/view/article_web_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocArticleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleFetchBloc, ArticleFetchState>(builder: (_, articleFetchState) {
      if (articleFetchState.isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      if (articleFetchState.hasData) {
        return _buildArticleListView(articleViewModels: articleFetchState.data);
      }

      return const SizedBox.shrink();
    });
  }

  ListView _buildArticleListView({
    @required List<ArticleViewModel> articleViewModels,
  }) =>
      ListView.builder(
          itemCount: articleViewModels.length,
          itemBuilder: (BuildContext context, int index) {
            final articleViewModel = articleViewModels[index];
            return ListTile(
              leading: Image.network(
                articleViewModel.imageUrl,
                width: 80,
                height: 80,
              ),
              title: Text(articleViewModel.title),
              subtitle: Text(articleViewModel.author),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArticleWebPage(url: articleViewModels[index].url)));
              },
            );
          });
}
