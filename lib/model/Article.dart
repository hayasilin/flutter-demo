class Article {
  String title;
  String author;
  String url;

  Article.fromeJSON(Map json)
      : title = json['title'],
        author = json['author'],

        url = json['url'];

  Map toJson() {
    return {'title': title, 'author': author, 'url': url};
  }
}