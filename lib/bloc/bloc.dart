import '../model/response.dart';
import '../repository/repository.dart';
import 'package:rxdart/rxdart.dart';


class BLoC {
  final Repository _repository = Repository();
  final BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  getArticle(int page) async {
    UserResponse response = await _repository.getArticle(page);
    UserResponse mergeResponse = UserResponse(
      _subject.value != null ? _subject.value.list : List(),
      response.error
    );
    if(page == 1) mergeResponse.list.clear();
    mergeResponse.list.addAll(response.list);
    _subject.add(mergeResponse);
  }

  dispose() => _subject.close();

  BehaviorSubject<UserResponse> get subject => _subject;
}