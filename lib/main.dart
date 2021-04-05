import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'src/article.dart';
import 'package:hn_app/src/hn_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  final hnBloc = HackerNewsBloc();
  runApp(MyApp(bloc: hnBloc));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.bloc}) : super(key: key);

  final HackerNewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutted Hacker News', bloc: bloc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;
  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: LoadingInfo(
          isLoading: widget.bloc.isLoading,
        ),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView([]),
        builder: (context, snapshot) => ListView(
          children: snapshot.data.map(_buildItem).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: "Top Stories",
            icon: Icon(
              Icons.arrow_drop_up,
            ),
          ),
          BottomNavigationBarItem(
            label: "New Stories",
            icon: Icon(
              Icons.new_releases,
            ),
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
          setState(() {
            _currentIndex = index;
          });
        },
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

class LoadingInfo extends StatefulWidget {
  LoadingInfo({Key key, this.isLoading}) : super(key: key);

  Stream<bool> isLoading;

  @override
  _LoadingInfoState createState() => _LoadingInfoState();
}

class _LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.isLoading,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        return FadeTransition(
          child: Icon(
            FlutterIcons.hacker_news_faw,
            color: Colors.black,
          ),
          opacity: Tween(begin: .5, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeIn
            ),
          ),
        );
      },
    );
  }
}
