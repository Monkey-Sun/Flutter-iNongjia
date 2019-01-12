import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimationNavi{
  static push(context, StatefulWidget targetPage, Function callback){
//    自定义动画 push   这里有个问题 为什么 使用 PageRouteBuilder 会导致无法侧滑返回
//    Navigator.of(context).push( new PageRouteBuilder(pageBuilder: (BuildContext context,
//        Animation<double> animation,
//        Animation<double> secondaryAnimation) {
//      return targetPage;
//    }, transitionsBuilder: (
//        BuildContext context,
//        Animation<double> animation,
//        Animation<double> secondaryAnimation,
//        Widget child,
//        ) {
//      return createTransition(animation, child);
//    }));
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return targetPage;
        }
    )).then((dynamic result){
      if(callback != null){
        callback(result);
      }
    });
  }

  static pop(context, params){
    Navigator.of(context).pop(params);
  }

  static createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
}