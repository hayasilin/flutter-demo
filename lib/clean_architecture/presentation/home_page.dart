import 'package:flutter/material.dart';
import 'package:flutter_app/clean_architecture/presentation/home_bloc.dart';
import 'package:flutter_app/view/article_web_page.dart';
import 'package:provider/provider.dart';

import 'article_view_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_homeBloc == null) {
      _homeBloc = Provider.of<HomeBloc>(context);
      _homeBloc.getArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _homeBloc.articleResults,
            builder: (BuildContext context, AsyncSnapshot<List<ArticleViewModel>> snapshot) {
              if (snapshot.hasData) {
                return _buildArticleListView(articleViewModels: snapshot.data);
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ArticleWebPage(url: articleViewModels[index].url)));
              },
            );
          });
}
