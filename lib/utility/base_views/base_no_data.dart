import 'package:flutter/material.dart';

class BaseNoData extends StatelessWidget {
  final String? message;
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  const BaseNoData({Key? key, this.message, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: Text(message??"No record available",style: TextStyle(color: Colors.grey)),
    ));
  }
}
