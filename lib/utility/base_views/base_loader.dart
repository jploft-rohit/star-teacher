import 'package:flutter/material.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';

class BaseLoader extends StatelessWidget {
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  final bool? linearProgress;
  const BaseLoader({Key? key, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin, this.linearProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: (linearProgress??false)
          ? ClipRRect(borderRadius: BorderRadius.circular(10),child: LinearProgressIndicator(color: BaseColors.primaryColor,
            backgroundColor: BaseColors.primaryColor.withOpacity(0.3)))
          : Center(child: SizedBox(width: 25,height: 25,child: CircularProgressIndicator(color: BaseColors.primaryColor))),
    );
  }
}
