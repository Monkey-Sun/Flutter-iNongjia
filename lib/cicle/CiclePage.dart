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
    ShareHttp().get('v3/wxappapi/find', {'userId': 29, 'page': 2}, (res) {
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
        child: FlatButton(
            onPressed: () {
              _loadFind();
            },
            child: Text("网络错误，点击重新加载")),
      );
    }
  }

  _buildFindPage() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _buildRow(model.context[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Color(0xFFE5E5E5),
            height: 1,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          );
        },
        itemCount: model.context.length);
  }

  _buildRow(FindItem item) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopView(item),
          _buildTextContent(item),
          _buildAlbum(item),
          _buildProductView(item.product),
          _buildUsers(item)
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
              Text(
                item.nickname,
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontFamily: 'PingFangHK-Regular'),
              ),
              Text(
                item.createTime.toString(),
                style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 10,
                    fontFamily: 'PingFangHK-Regular'),
              ),
            ],
          ),
        ))
      ],
    );
  }

  _buildTextContent(FindItem item) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Text(item.content.textContent,
          style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              fontFamily: 'PingFangHK-Regular'),
          maxLines: 5),
    );
  }

  _buildAlbum(FindItem item) {
    return Wrap(
      spacing: 7.5,
      runSpacing: 7.5,
      children: _buildPhoto(item.content.photos),
    );
  }

  _buildPhoto(List<Photo> photos) {
    List<Widget> widgetList = List();
    photos.forEach((photo) {
      widgetList.add(Image.network(
        photo.thumbUrl,
        width: 110,
        height: 110,
      ));
    });
    return widgetList;
  }

  _buildProductView(Product product) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Color(0xFFF4F4F4),
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            product.cover,
            width: 44,
            height: 44,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                '${product.productName}|${product.productDesc}',
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF333333),
                    fontFamily: 'PingFangHK-Medium'),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF999999),
            size: 14,
          )
        ],
      ),
    );
  }

  _buildUsers(FindItem item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: _buildAvatars(item.users),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('共1000个人喜欢', style: TextStyle(color: Color(0xFF999999) ,fontSize: 10),),
            )
          ],
        ),
        FlatButton(onPressed: (){}, child: Text('我也要'))
      ],
    );
  }

  _buildAvatars(List<User> users){
    List<Widget> widgets = List();
    for(var i = 0; i < users.length; i++){
      var u = users[i];
      var c = Container(
        padding: EdgeInsets.fromLTRB(24.0 * i, 0, 0, 0),
        child: CircleAvatar(backgroundImage: NetworkImage(u.avatar),radius: 14,),
      );
      widgets.add(c);
    }
    return widgets;
  }
}
