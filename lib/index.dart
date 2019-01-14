import 'package:flutter/material.dart';
import 'package:flutter_app/home/HomePage.dart';
import 'package:flutter_app/profile/Profile.dart';
import 'package:flutter_app/cicle/CiclePage.dart';

class Index extends StatefulWidget {
  @override
  State createState() => new _IndexState();
}

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _navigationItems;
  List<Widget> _screens = [];

  void initState() {
    super.initState();
    _navigationItems = <BottomNavigationBarItem>[
       BottomNavigationBarItem(
          icon:  Icon(Icons.home), title:  Text("首页")),
       BottomNavigationBarItem(
          icon:  Icon(Icons.camera), title:  Text("晒单")),
       BottomNavigationBarItem(
          icon:  Icon(Icons.person), title:  Text("个人"))
    ];

    _screens = [ HomePage(),  CiclePage(),  ProfilePage()];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _bottomNavigationBar =  BottomNavigationBar(
        items: _navigationItems,
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        });

    return new Scaffold(
      appBar: null,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
