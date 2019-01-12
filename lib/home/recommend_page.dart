import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/global_config.dart';
import 'dart:io';
import 'dart:convert';
import 'goods_detail.dart';
import 'package:flutter_app/home/recommendmodel/model.dart';
import 'package:flutter_app/animation_navigator.dart';

const kTestString = 'sunjunxiang';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RecommendState();
  }
}

class RecommendState extends State<RecommendPage>  with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

   Model model;
   @override
   void initState(){
     super.initState();
     _getHomeData();
   }

   _getHomeData() async {
    var url = 'https://api.inongjia.net/api/v3/wxappapi/home';
    var httpClient = new HttpClient();
    String result;
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
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      print("失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(model!=null){
      return ListView.builder(
          itemCount: model.Context.chosens.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index, model.Context.chosens[index]);
          });
    }else{
      return new Center(
        child: new CupertinoActivityIndicator(),
      );
    }
  }

  Widget _buildItem(int index,Goods item) {
    return new Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: new FlatButton(onPressed: (){
          AnimationNavi.push(context, new GoodsDetailPage(productDesc:item.productDesc, option:1), (res){
            print(res);
          });
        }, child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  width: 120,
                  height: 120,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                          image: NetworkImage(
                              item.cover))),
                ),
                new Expanded(
                    child: new Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      height: 120,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[new Text(
                          item.productName,
                          style:GlobalConfig.t1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ), new Text(
                            item.productDesc,
                            style:GlobalConfig.t2,
                            maxLines:3,
                            overflow: TextOverflow.ellipsis,)],
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
        )));
  }
}

//dart 闭包
Function add(num addBy){  // Function 闭包 返回一个block
  return (num i) => addBy + i;
}

void testF(){ //
  var s = 'string interpolation';
  // ${expression}。如果表达式是一个比赛服，可以省略 {}。
  print('Dart has $s, which is very handy.');

  print('That deserves all caps. ' +
  '${s.toUpperCase()} is very handy!');

  print('我的名字叫$kTestString');
}


class Person extends Object{
  final String name;
  final String age;
  Person(this.name, this.age);
  void sayHello(){
    print("我叫$name今年$age， 我是一名开发者");
  }

  static void sayclMethed(){ //静态方法(类方法) 前面加static
    print("操你妈逼~");
  }
}

class Student extends Person{
  final String num;
//  有时候一个构造函数会调动类中的其他构造函数。 一个重定向构造函数是没有代码的，在构造函数声明后，使用 冒号调用其他构造函数。
  Student(name, age, this.num):super(name, age);
  void sayHello() {
    // TODO: implement sayHello
//    super.sayHello();
    print("我叫$name今年$age,工号为$num");
  }
}
