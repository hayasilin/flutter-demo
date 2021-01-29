import 'package:flutter/material.dart';
import 'package:flutter_app/view/album_page.dart';
import 'package:flutter_app/view/article_list_page.dart';
import 'package:flutter_app/view/UserListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ArticleListPage(),
    );
  }
}