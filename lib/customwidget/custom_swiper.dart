import 'dart:async';
import 'package:flutter/material.dart';

class CustomSwiper extends StatefulWidget {
  final List<String> imageUrls;
  final OnTapBannerItem onTap;

  CustomSwiper(this.imageUrls, this.onTap, {Key key})
      :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _swiperState();
  }
}

class _swiperState extends State<CustomSwiper> {
  int virtualIndex = 0;
  int realIndex = 1;
  PageController controller;
  Timer timer;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: realIndex);
    timer = Timer.periodic(Duration(seconds: 5), (timer) { // 自动滚动
      /// print(realIndex);
      controller.animateToPage(realIndex + 1,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 226.0,
      child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView(
              controller: controller,
              onPageChanged: _onPageChanged,
              children: _buildItems(),),
            _buildIndicator(), // 下面的小点
          ]),
    );
  }

  List<Widget> _buildItems() { // 排列轮播数组
    List<Widget> items = [];
    if (widget.imageUrls.length > 0) {
      // 头部添加一个尾部Item，模拟循环
      items.add(
          _buildItem(widget.imageUrls[widget.imageUrls.length - 1], 0));
      // 正常添加Item
      for(int index = 0; index < widget.imageUrls.length; index++){
        items.add(_buildItem(widget.imageUrls[index], index));
      }
      // 尾部
      items.add(
          _buildItem(widget.imageUrls[0], widget.imageUrls.length-1));
    }
    return items;
  }

  Widget _buildItem(String url, int index) {
    return GestureDetector(
      onTap: () { // 按下
        if (widget.onTap != null) {
          widget.onTap(index);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(url, fit: BoxFit.cover),
          _buildItemTitle(" "), // 内容文字,大意
        ],),);
  }

  Widget _buildItemTitle(String title) {
    return Container(
      decoration: BoxDecoration( /// 背景的渐变色
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: const Alignment(0.0, -0.8),
          colors: [const Color(0xa0000000), Colors.transparent],
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
        child: Text(
          title, style: TextStyle(color: Colors.white, fontSize: 18.0),),),
    );
  }

  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.imageUrls.length; i++) {
      indicators.add(Container(
          width: 6.0,
          height: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == virtualIndex ? Colors.white : Colors.grey)));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators);
  }

  _onPageChanged(int index) {
    realIndex = index;
    int count = widget.imageUrls.length;
    if (index == 0) {
      virtualIndex = count - 1;
      controller.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      controller.jumpToPage(1);
    } else {
      virtualIndex = index - 1;
    }
    setState(() {});
  }
}

typedef void OnTapBannerItem(int index);