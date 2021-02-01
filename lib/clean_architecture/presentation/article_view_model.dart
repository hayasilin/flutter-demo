import 'package:flutter/material.dart';

class ArticleViewModel {
  final String title;
  final String author;
  final String url;
  final String imageUrl;

  ArticleViewModel({
    @required this.title,
    @required this.author,
    @required this.url,
    @required this.imageUrl,
  });
}