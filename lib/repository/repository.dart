import '../model/response.dart';
import 'api_provider.dart';


class Repository {
  ApiProvider _provider = ApiProvider();

  Future<UserResponse> getArticle(int page) => _provider.getArticle(page);
}