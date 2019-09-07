import 'package:flutter/material.dart';
import 'package:flutter_app/global_config.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CatogoryPageState();
  }
}

class CatogoryPageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
    List<ListItem> listData;
  int   colorNum = 255;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody();
  }

  _getBody() {
    listData = [];
    for (int i = 0; i < 20; i++) {
      listData.add(new ListItem("我是测试标题$i", Icons.cake));
    }

    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          if(notification.depth == 0) {
            setState(() {
                colorNum = ((1 - progress) * 255).toInt();
            });
          }
        },
        child: NestedScrollView(
            headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[SliverAppBar(
                backgroundColor: GlobalConfig.appBarBackgroundColor,
                primary: true,
                forceElevated: false,
                automaticallyImplyLeading: true,
                titleSpacing: NavigationToolbar.kMiddleSpacing,
                snap: false,
                //与floating结合使用
                expandedHeight: 300.0,
                //展开高度
                floating: false,
                //是否随着滑动隐藏标题
                pinned: true,
                //是否固定在顶部
                flexibleSpace: FlexibleSpaceBar(
                  //可以展开区域，通常是一个FlexibleSpaceBar
                    centerTitle: true,
                    title: Text("深深地沉",
                        style: TextStyle(
                          color: Color.fromRGBO(colorNum, colorNum, colorNum, 1),
                        )),
                    background: Image.network(
                      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2202808034,428312241&fm=26&gp=0.jpg",
                      fit: BoxFit.fill,
                    )),
              )];
            },
            body: Center(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListItemWidget(listData[index]);
                },
                itemCount: listData.length,
              ),
            )
        )
    );
  }
}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new ListTile(
        leading: new Icon(listItem.iconData),
        title: new Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}
