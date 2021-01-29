import 'package:flutter/material.dart';
import 'package:flutter_app/model/Article.dart';
import 'package:flutter_app/network/NetworkClient.dart';
import 'dart:convert';

import 'article_web_view.dart';

class ArticleListView extends StatefulWidget {
  @override
  createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State {
  var articles = new List<Article>();

  void _getArticles() {
    NetworkClient.getArticles().then((response) {
      setState(() {
        Utf8Decoder utf8decoder = Utf8Decoder();
        var data = json.decode(utf8decoder.convert(response.bodyBytes));
        Iterable list = data['list'];
        articles = list.map((model) => Article.fromJSON(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article List")),
      body: ListView.builder(
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
                  context, MaterialPageRoute(builder: (context) => ArticleWebView(url: articles[index].url)));
            },
          );
        },
      ),
    );
  }
}
