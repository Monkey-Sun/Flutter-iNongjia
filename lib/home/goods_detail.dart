import 'package:flutter/material.dart';
import 'package:flutter_app/animation_navigator.dart';

class GoodsDetailPage extends StatefulWidget {
  final String productDesc; //final 只能被赋值一次
  GoodsDetailPage({this.productDesc, int option}); // [type varname] 可选参数
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GoodsDetailState(this.productDesc);
  }
}

class GoodsDetailState extends State<GoodsDetailPage> {
  String desc;

  GoodsDetailState(this.desc);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("商祥"),
        ),
        body: new Container(
          padding: EdgeInsets.all(0),
          child: new FlatButton(
            onPressed: () {
              AnimationNavi.pop(context, "我日你先人板凳");
            },
            child: new Text(desc),
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
