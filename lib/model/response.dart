import 'article.dart';


class UserResponse {
  final List<Article> list;
  final String error;

  UserResponse(
      this.list,
      this.error
  );

  UserResponse.fromJSON(Map<String, dynamic> json)
    : list = (json['articles'] as List).map((i) => Article.fromJSON(i)).toList(),
      error = '';

  UserResponse.withError(String error)
    : list = List(),
      error = error;
}