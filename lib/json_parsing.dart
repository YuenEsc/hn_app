import 'package:built_value/built_value.dart';

part 'json_parsing.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  // Fields
  int get id;

  Article._();

  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

// class Article {
//   final String text;
//   final String url;
//   final String by;
//   final int time;
//   final int score;

//   const Article(
//       {this.text, this.url, this.by, this.time, this.score});

//   factory Article.fromJson(Map<String, dynamic> json){
//     if(json == null)
//       return null;
    
//     return Article(
//       text: json['text'] ?? 'null',
//       url: json['url'],
//       by: json['by'],
//       time: json['time'],
//       score: json['score']
//     );
//   }
// }

List<int> parseTopStories(String json){
  return [];
  // final parsed = jsonDecode(json);
  // final listOfIds = List<int>.from(parsed);
  // return listOfIds;
}

Article parseArticle(String json){
  return null;
  // final parsed = jsonDecode(json);
  // Article article = Article.fromJson(parsed);
  // return article;
}