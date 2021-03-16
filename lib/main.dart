import 'package:flutter/material.dart';
import 'package:hn_app/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  Future<Article> _getArticle(int id) async {
    print(id);
    final storyUrl = Uri.https('hacker-news.firebaseio.com', '/v0/item/$id.json');
    final storyRes = await http.get(storyUrl);
    print(storyRes.statusCode);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids
            .map(
              (i) => FutureBuilder<Article>(
                future: _getArticle(i),
                builder:
                    (BuildContext context, AsyncSnapshot<Article> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _buildItem(snapshot.data);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        
                      ),
                    );
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 24.0),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${article.type}"),
              IconButton(
                  onPressed: () {
                    _launchURL(article.url);
                  },
                  icon: Icon(Icons.launch),
                  color: Theme.of(context).primaryColor)
            ],
          )
        ],
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
