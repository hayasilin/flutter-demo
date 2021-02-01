// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDto _$ArticleDtoFromJson(Map<String, dynamic> json) {
  return ArticleDto(
    title: json['title'] as String,
    author: json['author'] as String,
    url: json['url'] as String,
    imageList: json['img_list'] as List,
  );
}

Map<String, dynamic> _$ArticleDtoToJson(ArticleDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'url': instance.url,
      'img_list': instance.imageList,
    };
