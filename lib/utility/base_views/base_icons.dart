import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/images_icon_path.dart';

class BaseIcons{
  /// Delete Icon With Functionality
  delete({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin,bool? showDeleteReason}){
    return GestureDetector(
      onTap: (){
        if (showDeleteReason??false) {
          BaseOverlays().showReasonDeleteDialog(
            title: title??"Delete",
            controller: TextEditingController(),
          );
        }else{
          BaseOverlays().showConfirmationDialog(
              title: title??"Are you sure you want to delete this data?",
              onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().dismissOverlay();}
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
        child: SvgPicture.asset(icDelete,height: 2.h,width: 2.h,)
      ),
    );
  }

  /// Save Icon With Functionality
  save({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: (){
        BaseOverlays().showConfirmationDialog(
            title: title??"Are you sure you want to save this data?",
            onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().dismissOverlay();}
        );
      },
      child: Padding(
          padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
          child: SvgPicture.asset(icSave,height: 2.h,width: 2.h,)
      ),
    );
  }

  /// View Icon With Functionality
  view({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: (){
        BaseOverlays().showConfirmationDialog(
            title: title??"Are you sure you want to view this data?",
            onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().dismissOverlay();}
        );
      },
      child: Padding(
          padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
          child: SvgPicture.asset(icEye,height: 2.5.h,width: 2.5.h,)
      ),
    );
  }

  /// Download Icon With Functionality
  download({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: (){
        BaseOverlays().showConfirmationDialog(
            title: title??"Are you sure you want to download this data?",
            onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().dismissOverlay();}
        );
      },
      child: Padding(
          padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
          child: SvgPicture.asset(icDownload,height: 2.h,width: 2.h,)
      ),
    );
  }

  /// Edit Icon With Functionality
  edit({String? title, Function()? onRightButtonPressed,double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: (){
        BaseOverlays().showConfirmationDialog(
            title: title??"Are you sure you want to edit this data?",
            onRightButtonPressed: onRightButtonPressed??(){BaseOverlays().dismissOverlay();}
        );
      },
      child: Padding(
          padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
          child: SvgPicture.asset(icEdit,height: 2.h,width: 2.h,)
      ),
    );
  }

  /// COPY Icon With Functionality
  copy({required String copiedData, double? leftMargin, double? rightMargin, double? topMargin, double? bottomMargin}){
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: copiedData));
        Fluttertoast.showToast(msg: "Copied");
      },
      child: Padding(
          padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
          child: SvgPicture.asset(icCopy)
      ),
    );
  }
}