import 'package:flutter/material.dart';

class BaseLoader extends StatelessWidget {
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  const BaseLoader({Key? key, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: Center(child: SizedBox(width: 25,height: 25,child: CircularProgressIndicator())),
    );
  }
}
