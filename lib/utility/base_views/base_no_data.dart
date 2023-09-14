import 'package:flutter/material.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class BaseNoData extends StatelessWidget {
  final String? message;
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  const BaseNoData({Key? key, this.message, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: Text(message??(translate(context).no_record_available),style: const TextStyle(color: Colors.grey)),
    ));
  }
}
