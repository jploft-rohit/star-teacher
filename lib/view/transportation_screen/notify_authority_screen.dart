import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/view/transportation_screen/controller/transportation_screen_ctrl.dart';
import 'package:staff_app/view/transportation_screen/notify_school_administrator.dart';

class NotifyAuthorityForBusScreen extends StatefulWidget {
  const NotifyAuthorityForBusScreen({Key? key}) : super(key: key);

  @override
  State<NotifyAuthorityForBusScreen> createState() => _NotifyAuthorityForBusScreenState();
}

class _NotifyAuthorityForBusScreenState extends State<NotifyAuthorityForBusScreen> {

  TransportationScreenCtrl controller = Get.find<TransportationScreenCtrl>();

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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: BaseColors.borderColor
                    )
                ),
                child: Obx(()=>ListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp, bottom: 15.sp),
                  leading: Container(
                    height: 20.w,
                    width: 17.w,
                    padding: EdgeInsets.only(top: 7.sp, bottom: 7.sp, left: 7.sp, right: 7.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BaseImageNetwork(
                      link: controller.tripData.value.passangerUser?.profilePic??"",
                      concatBaseUrl: false,
                      borderRadius: 10,
                      errorWidget: SvgPicture.asset(manSvg),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(toBeginningOfSentenceCase(controller.tripData.value.passangerUser?.name??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(height: 2),
                      Text("#${controller.tripData.value.passangerUser?.emirateId??"N/A"}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(height: 2),
                      Text(toBeginningOfSentenceCase(controller.tripData.value.passangerUser?.role?.name??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  trailing: GestureDetector(onTap: (){
                    showScanQrDialogue(context, false);
                  },child: BaseQr(data: controller.tripData.value.passangerUser?.barcode??"")),
                ),
                ),
              ),
              SizedBox(height: 2.h),
              Text("${translate(context).select_your_option} :", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp),),
              SizedBox(height: 1.h),
               Obx(()=>GestureDetector(
                 onTap: (){
                   if (controller.isFirstOptionSelected.value) {
                     controller.isFirstOptionSelected.value = false;
                     controller.optionsList[0] = LocalOptionModel();
                   }else{
                     controller.isFirstOptionSelected.value = true;
                     controller.optionsList[0] = LocalOptionModel(option: "I will be absent today.");
                   }
                 },
                 child: Container(
                   margin: EdgeInsets.only(bottom: 8.0),
                   padding: EdgeInsets.all(14.sp),
                   height: 6.5.h,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.0),
                       border: Border.all(color: BaseColors.primaryColor)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("I will be absent today.", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                       Visibility(
                         visible: controller.isFirstOptionSelected.value,
                         child: Container(
                           height: 20,
                           width: 20,
                           decoration: BoxDecoration(
                               color: controller.isFirstOptionSelected.value
                                   ? BaseColors.backgroundColor
                                   : BaseColors.borderColor,
                               boxShadow: [getLightBoxShadow()],
                               border: controller.isFirstOptionSelected.value
                                   ? Border.all(
                                   color: BaseColors.primaryColor, width: 1.5)
                                   : Border.all(
                                   color: Colors.transparent, width: 1.5),
                               borderRadius: BorderRadius.circular(30.0)),
                           child: Container(
                             decoration: BoxDecoration(
                                 border: Border.all(
                                     color: BaseColors.white, width: 1.5),
                                 shape: BoxShape.circle,
                                 boxShadow: [getBoxShadow()],
                                 color: controller.isFirstOptionSelected.value
                                     ? BaseColors.primaryColor
                                     : BaseColors.borderColor
                             ),
                             child: Center(
                               child: Icon(Icons.check, color: BaseColors.white,
                                   size: 16.sp),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
              ),
              Divider(),
              SizedBox(height: 1.h),
              Obx(()=>GestureDetector(
                onTap: (){
                  if (controller.isSecondOptionSelected.value) {
                    controller.isSecondOptionSelected.value = false;
                    controller.optionsList[1] = LocalOptionModel();
                  }else{
                    controller.isSecondOptionSelected.value = true;
                    controller.optionsList[1] = LocalOptionModel(option: "Going to school by my own vehicle.");
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  height: 6.5.h,
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: BaseColors.primaryColor)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Going to school by my own vehicle.", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                      Visibility(
                        visible: controller.isSecondOptionSelected.value,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: controller.isSecondOptionSelected.value
                                  ? BaseColors.backgroundColor
                                  : BaseColors.borderColor,
                              boxShadow: [getLightBoxShadow()],
                              border: controller.isSecondOptionSelected.value
                                  ? Border.all(
                                  color: BaseColors.primaryColor, width: 1.5)
                                  : Border.all(
                                  color: Colors.transparent, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: BaseColors.white, width: 1.5),
                                shape: BoxShape.circle,
                                boxShadow: [getBoxShadow()],
                                color: controller.isSecondOptionSelected.value
                                    ? BaseColors.primaryColor
                                    : BaseColors.borderColor
                            ),
                            child: Center(
                              child: Icon(Icons.check, color: BaseColors.white,
                                  size: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              Obx(()=>GestureDetector(
                onTap: (){
                  if (controller.isThirdOptionSelected.value) {
                    controller.isThirdOptionSelected.value = false;
                    controller.optionsList[2] = LocalOptionModel();
                  }else{
                    controller.isThirdOptionSelected.value = true;
                    controller.optionsList[2] = LocalOptionModel(option: "Returning home by my own vehicle.");
                  }
                },
                child: Container(
                  height: 6.5.h,
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: BaseColors.primaryColor)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Returning home by my own vehicle.", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                      Visibility(
                        visible: controller.isThirdOptionSelected.value,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: controller.isThirdOptionSelected.value
                                  ? BaseColors.backgroundColor
                                  : BaseColors.borderColor,
                              boxShadow: [getLightBoxShadow()],
                              border: controller.isThirdOptionSelected.value
                                  ? Border.all(
                                    color: BaseColors.primaryColor, width: 1.5)
                                  : Border.all(
                                  color: Colors.transparent, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: BaseColors.white, width: 1.5),
                                shape: BoxShape.circle,
                                boxShadow: [getBoxShadow()],
                                color: controller.isThirdOptionSelected.value
                                    ? BaseColors.primaryColor
                                    : BaseColors.borderColor
                            ),
                            child: Center(
                              child: Icon(Icons.check, color: BaseColors.white,
                                     size: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 3.h,
              ),
              Center(child: BaseButton(title: "SUBMIT", onPressed: (){
                // if (controller.isFirstOptionSelected.value) {
                //
                // }
                // controller.optionsList.forEach((element) {
                //   print(element.option??"");
                // });
                if (controller.isFirstOptionSelected.value || controller.isSecondOptionSelected.value || controller.isThirdOptionSelected.value) {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return NotifySchoolAdministratorPopup();
                    },
                  );
                }else{
                  baseToast(message: "Please Select At Least 1 Option");
                }
              },btnType: largeButton))
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
        GestureDetector(
          onTap: (){
            controller.optionsList.add(LocalOptionModel(option: ""));
          },
          child: Container(
            width: Get.width,
            margin: EdgeInsets.only(bottom: 8.0),
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: BaseColors.primaryColor)
            ),
            child: Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp),),
          ),
        ),
        Align(alignment: AlignmentDirectional.centerEnd,child: SvgPicture.asset(checkEnableSvg)),
      ],
    );
  }
}
