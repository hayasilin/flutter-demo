
import 'package:json_annotation/json_annotation.dart';

part 'article_dto.g.dart';

@JsonSerializable()
class ArticleDto {
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'author')
  final String author;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'img_list')
  List<dynamic> imageList;

  ArticleDto({
    this.title,
    this.author,
    this.url,
    this.imageList
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => _$ArticleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDtoToJson(this);
}
