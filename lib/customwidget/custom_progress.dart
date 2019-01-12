import 'package:flutter/material.dart';

const double kDefultHeight = 10.0;

class CustomProgress extends StatefulWidget {
  final double value;
  final Color backgroundColor;
  final valueColor;

  CustomProgress(this.value, this.backgroundColor, this.valueColor);

  @override
  State createState() => new CustomState(value, backgroundColor, valueColor);
}

class CustomState extends State<CustomProgress> {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  double width = 0;

  CustomState(this.value, this.backgroundColor, this.valueColor);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 20), () => _updateState());// fps 1/60秒感受不到延时
  }

  _updateState(){
    setState(() {
      width = context.size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(width == 0){
      return new Container(
        height: kDefultHeight,
      );
    }else{
      return new Stack(
        children: <Widget>[
          _buildBackgroundWidget(backgroundColor),
          new Container(
            height: kDefultHeight,
            width: 0.5 * width,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: valueColor,
            ),
          )
        ],
      );
    }
  }
}

Container _buildBackgroundWidget(Color backgroundColor) {

  return new Container(
      height: kDefultHeight,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: backgroundColor,
      )
  );
}