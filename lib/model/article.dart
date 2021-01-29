class Article {
  String title;
  String author;
  String url;
  List<dynamic> imageList;

  Article({this.title, this.author, this.url, this.imageList});

  Article.fromJSON(Map<String, dynamic> json)
      : title = json['title'],
        author = json['author'],
        url = json['url'],
        imageList = json['img_list'];

  Map<String, dynamic> toJson() {
    return {'title': title, 'author': author, 'url': url, 'imageList': imageList};
  }
}
