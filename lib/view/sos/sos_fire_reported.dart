import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/sos/ask_for_help.dart';
import 'package:staff_app/view/sos/sos_warden_view.dart';

class FireReportedView extends StatefulWidget {
  const FireReportedView({Key? key}) : super(key: key);

  @override
  State<FireReportedView> createState() => _FireReportedViewState();
}

class _FireReportedViewState extends State<FireReportedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      // backgroundColor: CustomColors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColors.white,
        centerTitle: true,
        title: Text('SOS',style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: CustomColors.textRedColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 7.7.h),
            SvgPicture.asset(emergencySvg,height: 90,width: 90,),
            SizedBox(height: 3.4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Text(translate(context).fire_emergency, style: Style.montserratBoldStyle().copyWith(fontSize: 25.sp, color: CustomColors.white),),
            ),
            SizedBox(height: 3.7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Text(translate(context).fire_reported_at_please_report_to_assembly_point_for_evacuation, style: Style.montserratBoldStyle().copyWith(fontSize: 19.sp, color: CustomColors.white, height: 1.3),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 5.h),
            BaseButton(title: translate(context).reached.toUpperCase(), onPressed: (){Get.off(SOSWardenView());}),
            SizedBox(height: 3.7.h),
            BaseButton(title: translate(context).help_me.toUpperCase(), onPressed: (){Get.off(AskForHelpView());}),
            SizedBox(height: 2.8.h),
            Text('${translate(context).reported_by}: Ahmed (Teacher)', style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.white),),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
