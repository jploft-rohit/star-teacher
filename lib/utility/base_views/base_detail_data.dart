import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';

class BaseDetailData extends StatelessWidget {
  final String icon;
  final String detailsLabel;
  final String detailsValue;
  final double? topMargin,bottomMargin,rightMargin,leftMargin;
  final bool? showDivider;

  BaseDetailData({Key? key,this.icon="",required this.detailsLabel,this.detailsValue="", this.topMargin, this.bottomMargin, this.showDivider, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if(icon != "")
                Padding(
                  padding:  EdgeInsets.only(right: 1.h),
                  child: SvgPicture.asset(icon,height: 2.h,width: 2.h,),
                ),
                Flexible(
                child: Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: detailsValue != "" ? "${detailsLabel} : ":"${detailsLabel}",
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: detailLabelTs,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          )),
                      if(detailsValue != "" )
                        TextSpan(
                          text: "$detailsValue",
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: detailValueTs,
                            color: BaseColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(visible: showDivider??true, child: const Divider()),
        ],
      ),
    );
  }
}
