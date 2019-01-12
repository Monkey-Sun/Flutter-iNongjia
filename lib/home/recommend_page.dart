import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/global_config.dart';
import 'dart:io';
import 'dart:convert';
import 'goods_detail.dart';
import 'package:flutter_app/home/recommendmodel/model.dart';
import 'package:flutter_app/animation_navigator.dart';
import 'package:flutter_app/customwidget/custom_progress.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RecommendState();
  }
}

class RecommendState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Model model;
  bool  fail = false;
  @override
  void initState() {
    super.initState();
    _getHomeData();
  }

  _getHomeData() async {
    var url = 'https://api.inongjia.net/api/v3/wxappapi/home';
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Map modelMap = jsonDecode(json);
        setState(() {
          model = new Model.fromJson(modelMap);
        });
        print("请求成功");
      } else {
        setState(() {
          fail = true;
        });
      }
    } catch (exception) {
      setState(() {
        fail = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (model != null) {
      return ListView.builder(
          itemCount: model.Context.modulesvm.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index, model.Context.modulesvm[index]);
          });
    } else if(fail) {
      return new Center(
        child: new FlatButton(onPressed: (){
          _getHomeData();
        }, child: new Text("网络断开了，点击重试")),
      );
    }else{
      return new Center(
        child: new CupertinoActivityIndicator(),
      );
    }
  }

  Widget _buildItem(int index, Goods item) {
    return new Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: new FlatButton(
            onPressed: () {
              AnimationNavi.push(context,
                  new GoodsDetailPage(productDesc: item.productDesc, option: 1),
                  (res) {
                print(res);
              });
            },
            child: _buildBottomRow(item)));
  }
}

Widget _buildBottomRow(Goods item) {
  return new Column(
    children: <Widget>[
      new Row(
        children: <Widget>[
          new Container(
            width: 120,
            height: 120,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(image: NetworkImage(item.cover)),
                color: Colors.grey
            ),
          ),
          new Expanded(
              child: new Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: 120,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  item.productName,
                  style: GlobalConfig.t1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.productDesc,
                  style: GlobalConfig.t2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                new Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: new CustomProgress(
                        0.5, Color(0xFFF7AC9A), Color(0xFFE97459))),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      '￥${item.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFE97459),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color(0xFFE97459),
                      ),
                      child: new Text(
                        "马上抢",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
      new Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        color: Colors.grey,
        height: 1,
      )
    ],
  );
}
