import 'package:flutter/material.dart';
import 'nearby_page.dart';
import 'recommend_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("首页"),
          bottom: new TabBar(
            tabs: [new Tab(text: "推荐"), new Tab(text: "附近")],
          ),
        ),
        backgroundColor: Color(0xFFDCDCDC),
        body: new TabBarView(children: [new RecommendPage(), new NearbyPage()]),
      ),
    );
  }
}
