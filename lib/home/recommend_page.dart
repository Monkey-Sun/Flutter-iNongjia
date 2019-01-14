import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/global_config.dart';
import 'package:flutter_app/utils/http_manager.dart';
import 'goods_detail.dart';
import 'package:flutter_app/home/recommendmodel/model.dart';
import 'package:flutter_app/animation_navigator.dart';
import 'package:flutter_app/customwidget/custom_progress.dart';
import 'package:flutter_app/customwidget/custom_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  RequestStatu statu = RequestStatu.loading;

  @override
  void initState() {
    super.initState();
    _getHomeData();
  }

  _getHomeData(){
    var result;
    setState(() {
      statu = RequestStatu.loading;
    });
    HttpShareManager().get('v3/wxappapi/home', null, (res) {
      result = new Model.fromJson(res);
      setState(() {
        statu = RequestStatu.success;
        model = result;
      });
    }, (exception) {
      setState(() {
        statu = RequestStatu.fail;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (model != null) {
      return ListView.separated(
          itemCount: model.Context.modulesvm.length + 2,
          itemBuilder: (BuildContext context, int index) => _buildItem(index),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
                height: 1.0,
                color: index < 3 ? Colors.white : Color(0xFF999999));
          });
    }else{
      if(statu == RequestStatu.fail){
        return new Center(
          child: new FlatButton(
              onPressed: () {
                _getHomeData();
              },
              child: new Text("网络断开了，点击重试")),
        );
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    }
  }

  Widget _buildItem(int index) {
    if (index == 0) {
      return new Container(
        height: 110,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: new CustomSwiper(
            model.Context.midBanners.map((item) => item.imgUrl).toList(),
            (index) {
          print('点击了${index}');
          Fluttertoast.showToast(
              msg: "点击了第${index}个图片",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.cyan,
              textColor: Colors.white);
        }),
      );
    } else if (index == 1) {
      return new Container(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 220,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      'http://img.inongjia.net/wxapp/images/home_cnxh_n.png',
                      width: 78,
                      height: 26,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.Context.modulesvm.length,
                      itemBuilder: (BuildContext content, int index) {
                        return _buildScrollItem(model.Context.modulesvm[index]);
                      }))
            ],
          ));
    }
    if (index == 2) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'http://img.inongjia.net/wxapp/images/xlqg@2x.png',
              width: 78,
              height: 26,
            )
          ],
        ),
      );
    } else {
      return new Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: new FlatButton(
              onPressed: () {
                AnimationNavi.push(
                    context,
                    new GoodsDetailPage(
                        productDesc:
                            model.Context.modulesvm[index - 2].productDesc,
                        option: 1), (res) {
                  print(res);
                });
              },
              child: _buildGoodsRow(model.Context.modulesvm[index - 2])));
    }
  }
}

// 底部的row
Widget _buildGoodsRow(Goods item) {
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
                color: Colors.grey),
          ),
          new Expanded(
              child: new Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: 120,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
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
      )
    ],
  );
}

// 滚动的商品
Widget _buildScrollItem(Goods item) {
  return new Container(
    width: 106,
    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Image.network(
          item.cover,
          width: 106,
          height: 106,
        ),
        new Text(
          item.productName,
          maxLines: 1,
          style: GlobalConfig.t1,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            new Text("￥",
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFFE97459),
                    fontFamily: 'PingFang-SC-Heavy')),
            new Text(
              item.price.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFE97459),
                  fontFamily: 'PingFang-SC-Heavy'),
            )
          ],
        ),
        new Text('￥${item.rawPrice.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 10,
                color: Color(0xFF999999),
                decorationStyle: TextDecorationStyle.dashed))
      ],
    ),
  );
}
