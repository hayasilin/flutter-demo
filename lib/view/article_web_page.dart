import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebPage extends StatefulWidget {
  ArticleWebPage({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _ArticleWebPageState createState() => _ArticleWebPageState();
}

class _ArticleWebPageState extends State<ArticleWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("demo")),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
