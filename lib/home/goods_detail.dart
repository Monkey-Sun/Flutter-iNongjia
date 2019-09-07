import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

const int COUNTTIME = 20;

class GoodsDetailPage extends StatefulWidget {
  final String productDesc;
  GoodsDetailPage({this.productDesc, int option}); // [type varname] 可选参数
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GoodsDetailState(this.productDesc);
  }
}

class GoodsDetailState extends State<GoodsDetailPage> {
  GoodsDetailState(this.desc);
  String desc;
  String buttonTitle = "获取验证码";
  int  second = COUNTTIME;
  Timer countTimer;
  bool buttonEnable = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    VoidCallback onPressHandle = () {
      String tempTitle;
      countTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        second -= 1;
        if (this.second <= 1) {
          tempTitle = "获取验证码";
          second = COUNTTIME;
          timer.cancel();
        } else {
          tempTitle = second.toString() + 's后重新获取';
        }
        setState(() {
          buttonTitle = tempTitle;
          buttonEnable = second == COUNTTIME;
        });
      });
    };

    FlatButton button = new FlatButton(onPressed: (buttonEnable ? onPressHandle : null), textColor: Colors.red,child: new Text(buttonTitle), disabledColor: Colors.grey,);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("商详"),
      ),
      body: new Container(
        padding: EdgeInsets.all(0),
        child: button,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(countTimer != null){
      countTimer.cancel();
    }
  }
}
