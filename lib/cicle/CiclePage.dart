import 'package:flutter/material.dart';

class CiclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CiclePageState();
  }
}

class CiclePageState extends State<CiclePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('圈子'),
          actions: <Widget>[new Container()],
        ),
        body: new Center(child: null),
      ),
    );
  }
}