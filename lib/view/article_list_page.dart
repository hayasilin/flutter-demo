import 'package:flutter/material.dart';
import 'package:flutter_app/model/article.dart';
import 'package:flutter_app/network/network_client.dart';
import 'dart:convert';

import 'article_web_page.dart';

class ArticleListPage extends StatefulWidget {
  @override
  createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State {
//  var articles = new List<Article>();
//
//  void _getArticles() {
//    NetworkClient.getArticles().then((response) {
//      setState(() {
//        Utf8Decoder utf8decoder = Utf8Decoder();
//        var data = json.decode(utf8decoder.convert(response.bodyBytes));
//        Iterable list = data['list'];
//        articles = list.map((model) => Article.fromJSON(model)).toList();
//      });
//    });
//  }

  Future<List> _fetchArticles() async {
    var result = await NetworkClient.fetchArticles();
    return result;
  }

  @override
  void initState() {
    super.initState();
//    _getArticles();
    _fetchArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article List")),
      body: FutureBuilder(
          future: _fetchArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var articles = snapshot.data;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      articles[index].imageList.first,
                      width: 80,
                      height: 80,
                    ),
                    title: Text(articles[index].title),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ArticleWebPage(url: articles[index].url)));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
