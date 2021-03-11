// import 'dart:convert';

// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'serializers.dart';

// part 'json_parsing.g.dart';

// abstract class Article implements Built<Article, ArticleBuilder> {
//   static Serializer<Article> get serializer => _$articleSerializer;

//   // Fields
//   @nullable
//   int get id;
//   @nullable
//   bool get deleted;
//   @nullable
//   String get type;
//   @nullable
//   String get by;
//   @nullable
//   int get time;
//   @nullable
//   String get text;
//   @nullable
//   bool get dead;
//   @nullable
//   int get parent;
//   @nullable
//   int get poll;
//   BuiltList<int> get kids;
//   @nullable
//   String get url;
//   @nullable
//   int get score;
//   @nullable
//   String get title;
//   @nullable
//   BuiltList<int> get parts;
//   @nullable
//   int get descendants;

//   Article._();

//   factory Article([void Function(ArticleBuilder) updates]) = _$Article;
// }

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

List<int> parseTopStories(String json) {
  final parsed = jsonDecode(json);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonStr) {
  final parsed = jsonDecode(jsonStr);
  Article article = standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}
