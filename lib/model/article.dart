import 'source.dart';


class Article {
  final Source source;
  final String title;
  final String description;
  final String published;
  final String url;

  Article(
    this.source,
    this.title,
    this.description,
    this.published,
    this.url
  );

  Article.fromJSON(Map<String, dynamic> json)
    : source = Source.fromJSON(json['source']),
      title = json['title'],
      description = json['description'],
      published = json['publishedAt'],
      url = json['url'];
}