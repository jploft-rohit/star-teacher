import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/images_icon_path.dart';

class BaseIcons{
  /// Delete Icon With Functionality
  delete({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: (){
        BaseOverlays().showConfirmationDialog(
            title: title??"Are you sure you want to delete this data?",
            onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().closeOverlay();}
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
        child: SvgPicture.asset(icDelete,height: 2.h,width: 2.h,)
      ),
    );
  }

  /// Edit Icon With Functionality
  edit({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: (){
        BaseOverlays().showConfirmationDialog(
            title: title??"Are you sure you want to edit this data?",
            onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().closeOverlay();}
        );
      },
      child: Padding(
          padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
          child: SvgPicture.asset(icEdit,height: 2.h,width: 2.h,)
      ),
    );
  }
}