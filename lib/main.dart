import 'package:flutter/material.dart';
import 'global_config.dart';
import 'index.dart';

//main.dart  程序主入口 启动画面
void main() => runApp(new NongjiaApp());

class NongjiaApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '农佳',
      theme: GlobalConfig.themeData,
      home: new Index(),
    );
  }
}
