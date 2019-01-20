import 'package:flutter/material.dart';
import 'package:flutter_app/utils/http.dart';
import 'model.dart';

class CiclePage extends StatefulWidget {
  @override
  CiclePageState createState() => CiclePageState();
}

class CiclePageState extends State<CiclePage> {
  Model model;
  RequestStatu statu;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFind();
  }

  @override
  Widget build(BuildContext context) {
    RequestStatu statu = RequestStatu.loading;
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('晒单'),
            ),
            body: _buildStatus()));
  }

  _loadFind() {
    setState(() {
      statu = RequestStatu.loading;
    });
    ShareHttp().get('v3/wxappapi/find', {'userId': 29, 'page':2}, (res) {
      setState(() {
        model = new Model.fromJson(res);
        statu = RequestStatu.success;
      });
    }, () {
      setState(() {
        statu = RequestStatu.fail;
      });
    });
  }

  Widget _buildStatus() {
    if (statu == RequestStatu.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (statu == RequestStatu.success) {
      return _buildFindPage();
    } else {
      return Center(
        child: FlatButton(onPressed: () {
          _loadFind();
        }, child: Text("网络错误，点击重新加载")),
      );
    }
  }

  _buildFindPage() {
    return ListView.separated(itemBuilder: (context, index) {
      return _buildRow(model.context[index]);
    }, separatorBuilder: (context, index) {
      return Container(
        color: Color(0xFFE5E5E5),
        height: 1,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      );
    }, itemCount: model.context.length);
  }

  _buildRow(FindItem item) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopView(item),
          _buildTextContent(item),
          _buildAlbum(item)
        ],
      ),
    );
  }

  _buildTopView(FindItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
          radius: 20,
        ),
        Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.nickname,
                    style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 14,
                        fontFamily: 'PingFangHK-Regular'
                    ),),
                  Text(item.createTime.toString(),
                    style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 10,
                        fontFamily: 'PingFangHK-Regular'
                    ),),
                ],
              ),
            ))
      ],
    );
  }
  
  _buildTextContent(FindItem item){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Text(item.content.textContent,
          style: TextStyle(color: Color(0xFF333333), fontSize: 14, fontFamily: 'PingFangHK-Regular'),
          maxLines: 5
      ),
    );
  }

  _buildAlbum(FindItem item){
    return Wrap(
        spacing: 7.5,
        runSpacing: 7.5,
        children:_buildPhoto(item.content.photos),
      );
  }
  
  _buildPhoto(List<Photo> photos){
    List<Widget> widgetList = List();
    photos.forEach((photo){
      widgetList.add(Image.network(photo.thumbUrl, width: 120, height:120,));
    });
    return widgetList;
  }
}
