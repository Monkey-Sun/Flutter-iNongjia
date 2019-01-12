import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CatogoryPageState();
  }
}

class CatogoryPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('个人'),
          actions: <Widget>[new Container()],
        ),
        body: new Center(child: null),
      ),
    );
  }
}