import 'package:flutter/material.dart';

class NearbyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NearbyState();
  }
}

class NearbyState extends State<NearbyPage> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildList();
  }

  Widget _buildList() {
    return new ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, index) {
          return _buildRow(index);
        });
  }

  Widget _buildRow(index) {
    return Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.cyan,
        child: SizedBox(
          width: 375.0,
          height: 80.0,
          child: Text(
            '$index',
            style: TextStyle(fontSize: 72.0, color: Colors.white),
          ),
        ));
  }
}
