import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';

class BaseImageNetwork extends StatelessWidget {
  final String? link;
  final bool? concatBaseUrl;
  final double? topMargin,bottomMargin,rightMargin,leftMargin,height,width;
  const BaseImageNetwork({Key? key, this.link, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin, this.height, this.width, this.concatBaseUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,right: rightMargin??0,bottom: bottomMargin??0,left: leftMargin??0),
      child: Image.network((concatBaseUrl??true) ? ApiEndPoints().imageBaseUrl+(link??"") : (link??""),
        width: width??null,
        height: height??null,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, url, error) => Icon(Icons.image),
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },

      ),
    );
  }
}
