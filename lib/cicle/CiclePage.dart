import 'package:flutter/material.dart';
import 'package:flutter_app/utils/http_manager.dart';
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
//    _loadData();
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
          child: Text("晒单"),
        ),
      ),
    );
  }
}

_loadData(){
  var result;
  HttpShareManager().get('v3/wxappapi/find', null, (res){
    result = new Model.fromJson(res);
    print(result);
  }, (exception){

  });
}


Widget _buildList(){

}