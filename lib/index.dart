import 'package:flutter/material.dart';
import 'package:flutter_app/home/HomePage.dart';
import 'package:flutter_app/fenlei/CatogoryPage.dart';
import 'package:flutter_app/cicle/CiclePage.dart';
import 'package:flutter_app/profile/Profile.dart';



class Index extends StatefulWidget{

  @override
  State createState() => new _IndexState();
}

class _IndexState extends State<Index> with AutomaticKeepAliveClientMixin{
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _navigationItems;
  List<Widget> _screens = [];

  void initState(){
    super.initState();
    _navigationItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(icon: new Icon(Icons.assignment), title: new Text("首页")),
      new BottomNavigationBarItem(icon: new Icon(Icons.all_inclusive), title: new Text("分类" )),
      new BottomNavigationBarItem(icon: new Icon(Icons.add_alert), title: new Text("个人"))
    ];

    _screens =[
      new HomePage(),
      new CatogoryPage(),
      new ProfilePage()
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _bottomNavigationBar = new BottomNavigationBar(
        items: _navigationItems,
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState((){
            _currentIndex = index;
          });
        }
    );

    return new MaterialApp(
        home: new Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: _bottomNavigationBar,
        ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
