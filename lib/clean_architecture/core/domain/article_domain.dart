import 'package:flutter/material.dart';

class ArticleDomain {
  final String title;
  final String author;
  final String url;
  final String imageUrl;

  ArticleDomain({
    @required this.title,
    @required this.author,
    @required this.url,
    @required this.imageUrl,
  });
}