import 'package:flutter/material.dart';
import 'nearby_page.dart';
import 'recommend_page.dart';
import 'package:flutter_app/global_config.dart';
import 'package:flutter_app/customwidget/custom_searchbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text:"推荐"), Tab(text:"附近")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [RecommendPage(), new NearbyPage()],
      ),
    );
  }
}
