import 'package:flutter/material.dart';
import 'package:flutter_app/utils/http.dart';
import 'model.dart';

class CiclePage extends StatefulWidget {
  @override
  CiclePageState createState()=>CiclePageState();
}

class CiclePageState extends State<CiclePage> {
  Model model;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RequestStatu statu  = RequestStatu.loading;
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('晒单'),
        ),
        body: Center(
          child: FlatButton(onPressed: (){
            _loadFind();
          }, child: Text("晒单"))
        ),
      ),
    );
  }
}

_loadFind(){
  Model result;
  ShareHttp().get('v3/wxappapi/find', {
    'userId': 29
  }, (res){
    result = new Model.fromJson(res);
    print(result);
  }, (){

  });
}

Widget _buildList(){

}