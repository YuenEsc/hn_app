import 'package:hn_app/src/article.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';

class HackerNewsBloc {
  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  HackerNewsBloc() {
    _updateArticles().then((_){
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  List<int> _ids = [
    26466113,
    26477144,
    26470223,
    26476555,
    26477064,
    26476685,
    26476038,
    26478189,
    26473442,
    26474331
  ]; //articles;

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
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
