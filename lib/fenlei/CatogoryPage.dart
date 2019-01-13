import 'package:flutter/material.dart';

class CatogoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CatogoryPageState();
  }
}

class CatogoryPageState extends State<CatogoryPage> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(child: new Text("分类"));
  }
}