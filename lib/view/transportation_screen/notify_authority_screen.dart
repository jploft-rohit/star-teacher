import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/transportation_screen/notify_school_administrator.dart';

class NotifyAuthorityForBusScreen extends StatefulWidget {
  const NotifyAuthorityForBusScreen({Key? key}) : super(key: key);

  @override
  State<NotifyAuthorityForBusScreen> createState() => _NotifyAuthorityForBusScreenState();
}

class _NotifyAuthorityForBusScreenState extends State<NotifyAuthorityForBusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).notify_authority),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: BaseColors.borderColor
                    )
                ),
                child: ListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 15.sp, bottom: 15.sp),
                  leading: Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SvgPicture.asset(manSvg),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nawaj Alam", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("#12344534", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("English Teacher", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  trailing: GestureDetector(onTap: (){
                    showScanQrDialogue(context, false);
                  },child: SvgPicture.asset(qrCodeSvg)),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text("${translate(context).select_your_option} :", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp),),
              SizedBox(
                height: 1.h,
              ),
              buildTile("I will be absent today."),
              Divider(),
              SizedBox(
                height: 1.h,
              ),
              buildTile1("Going to school by my own vehicle."),
              buildTile1("Returning home by my own vehicle"),
              SizedBox(
                height: 3.h,
              ),
              Center(child: BaseButton(title: "SUBMIT", onPressed: (){
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return NotifySchoolAdministratorPopup();
                  },
                );
              },btnType: largeButton,))
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTile(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: BaseColors.primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp),),
          
        ],
      ),
    );
  }
  Widget buildTile1(String title) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          margin: EdgeInsets.only(bottom: 8.0),
          padding: EdgeInsets.all(14.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: BaseColors.primaryColor)
          ),
          child: Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp),),
        ),
        Align(alignment: AlignmentDirectional.centerEnd,child: SvgPicture.asset(checkEnableSvg)),
      ],
    );
  }
}
