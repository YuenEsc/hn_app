import 'dart:async';

import 'package:hn_app/src/article.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';

enum StoriesType { topStories, newStories }

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  final _storiesTypeController = StreamController<StoriesType>();

  HackerNewsBloc() {
    _getArticlesAndUpdate(_topIds);
    _storiesTypeController.stream.listen((storiesType) {
      if(storiesType == StoriesType.newStories){
        _getArticlesAndUpdate(_newsIds);
      } else {
        _getArticlesAndUpdate(_topIds);
      }
    });
  }

  _getArticlesAndUpdate(List<int> ids){
    _updateArticles(ids).then((_){
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  static List<int> _newsIds = [
    26476685,
    26476038,
    26478189,
    26473442,
    26474331
  ]; //articles;

  static List<int> _topIds = [
    26466113,
    26477144,
    26470223,
    26476555,
    26477064,
  ];

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

  Future<Article> _getArticle(int id) async {
    print(id);
    final storyUrl =
        Uri.https('hacker-news.firebaseio.com', '/v0/item/$id.json');
    final storyRes = await http.get(storyUrl);
    print(storyRes.statusCode);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }
}
