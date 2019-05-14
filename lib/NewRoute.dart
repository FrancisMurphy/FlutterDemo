import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NewRoute extends StatefulWidget {
  @override
  _NewPageState createState() =>new _NewPageState();
}

class _NewPageState extends State<NewRoute>
{
  String _randomString = 'Init string';

  void _getRandomString () {
    setState(() {
      final wordPair = new WordPair.random();
      _randomString = wordPair.toString();
    });}

  @override
  Widget build(BuildContext context) {
    //获取上个页面传递过来的参数
    var args=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: new Center(
//        child: Text("This is new route, and param from parent page is "+args),
        child: new Column(
          //主轴居中对其
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('This is new route, and param from parent page is ' + args),
            new Text('$_randomString'),
            new IconButton(
                icon: new Icon(Icons.announcement),
                onPressed: _getRandomString
            )
          ],
        ),
      ),
    );
  }
  }