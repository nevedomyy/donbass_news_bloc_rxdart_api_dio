import 'package:flutter/material.dart';
import '../model/article.dart';
import '../model/response.dart';
import '../bloc/bloc.dart';
import 'list_loading.dart';
import 'list_error.dart';
import 'single_article_loader.dart';
import 'single_article.dart';
import 'dotted_line.dart';


class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final BLoC _bloc = BLoC();
  ScrollController _scrollController;
  bool _hasReachedMax = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _bloc.getArticle(_page);
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  _init() async{
    _page = 1;
    _hasReachedMax = false;
    _bloc.getArticle(_page);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
  }

  //Developer accounts are limited to a max of 100 results = 5 page
  _scrollListener(){
    if(_scrollController.position.pixels > 0.9*_scrollController.position.maxScrollExtent){
      if(_page > 5) return;
      if(_page > 4) _hasReachedMax = true;
      _bloc.getArticle(_page++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid
                ))
              ),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Новости Донбасса',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _init(),
                child: StreamBuilder(
                  stream: _bloc.subject.stream,
                  builder: (context, AsyncSnapshot<UserResponse> snapshot){
                    if (snapshot.hasData) {
                      if (snapshot.data.error != null && snapshot.data.error.length > 0){
                        return ListError(
                          onTap: () => _init(),
                          error: snapshot.data.error,
                        );
                      }
                      return ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        controller: _scrollController,
                        separatorBuilder: (context, index){
                          return CustomPaint(
                            size: Size(double.infinity, 1),
                            painter: DottedLine(),
                          );
                        },
                        itemCount: _hasReachedMax
                            ? snapshot.data.list.length
                            : snapshot.data.list.length+1,
                        itemBuilder: (context, index){
                          if(index < snapshot.data.list.length){
                            Article article = snapshot.data.list[index];
                            return SingleArticle(
                              source: article.source.name ?? '',
                              title: article.title ?? '',
                              description: article.description ?? '',
                              published: article.published ?? '',
                              url: article.url ?? '',
                            );
                          }
                          return SingleArticleLoader();
                        },
                      );
                    } else if (snapshot.hasError) {
                      return ListError(
                        onTap: () => _init(),
                        error: snapshot.error,
                      );
                    } else return ListLoading();
                  }
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
