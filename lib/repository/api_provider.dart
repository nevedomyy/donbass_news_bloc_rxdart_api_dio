import '../model/response.dart';
import 'package:dio/dio.dart';


class ApiProvider {
  static final String _urlQuery = '(донбасс)OR(донецк)OR(луганск)OR(макеевка)OR(горловка)';
  static final String _urlExclude = 'fognews.d3.ru,politics.d3.ru,livejournal.com';
  static final String _urlKey = 'xxxxxxx';
  static final String _url = 'https://newsapi.org/v2/everything?q=${_urlQuery}&language=ru&excludeDomains=${_urlExclude}&sortBy=publishedAt&apiKey=${_urlKey}&page=';
  final Dio _dio = Dio();

  Future<UserResponse> getArticle(int page) async{
    try {
      Response response = await _dio.get(_url+page.toString());
      return UserResponse.fromJSON(response.data);
    } catch (e){
      return UserResponse.withError('Что-то пошло не так...');
    }
  }
}