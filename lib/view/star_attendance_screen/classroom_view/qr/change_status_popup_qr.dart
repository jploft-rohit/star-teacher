import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/intl/intl.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';

class ChangeStatusPopupQR extends StatefulWidget {
  final bool isFromLateView;
  final int index;
  ChangeStatusPopupQR({Key? key, required this.isFromLateView, required this.index,}) : super(key: key);

  @override
  State<ChangeStatusPopupQR> createState() => _ChangeStatusPopupQRState();
}

class _ChangeStatusPopupQRState extends State<ChangeStatusPopupQR> {
  StarAttendanceScreenCtrl controller = Get.find<StarAttendanceScreenCtrl>();
  TextEditingController reasonController = TextEditingController();
  String type = "";

  @override
  void initState() {
    super.initState();
    for(var i in controller.reasonList){
      if (i['isSelected']) {
        type = i['title'];
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Text(translate(context).change_Status, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: const Icon(Icons.close, color: Colors.black,),)
                    ],
                  ),
                  if(!widget.isFromLateView)...[
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${translate(context).name} : ',
                            style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                            children: <TextSpan>[
                              TextSpan(text: toBeginningOfSentenceCase(controller.qrSearchedList?[widget.index].student?.user?.name??""), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: .5.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${translate(context).current_status} : ',
                            style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                            children: <TextSpan>[
                              TextSpan(text: toBeginningOfSentenceCase(controller.qrSearchedList?[widget.index].attendanceType??"")??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.reasonList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            type = controller.reasonList[index]["title"];
                            for(var i in controller.reasonList){
                              i['isSelected'] = false;
                            }
                            controller.reasonList[index]['isSelected'] = !controller.reasonList[index]['isSelected'];
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            padding: EdgeInsets.all(14.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: BaseColors.primaryColor)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.reasonList[index]['title'], style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
                                Checkbox(
                                  visualDensity: const VisualDensity(vertical: -4),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  side: const BorderSide(color: Colors.transparent),
                                  activeColor: BaseColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  value: controller.reasonList[index]['isSelected'],
                                  onChanged: (value){
                                    for(var i in controller.reasonList){
                                      i['isSelected'] = false;
                                    }
                                    controller.reasonList[index]['isSelected'] = !controller.reasonList[index]['isSelected'];
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                      if(controller.reasonList.last['isSelected'] == true)
                      CustomTextField(controller: reasonController, hintText: "Reason",maxLine: 3)
                  ] else ...[
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: BaseColors.primaryColor)),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12.0,8,8,8),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: BaseColors.primaryColor)),
                                child:SvgPicture.asset(girlSvg),
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text('Roma #21', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.primaryColor),),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: List.generate(controller.statusList.length, (index) {
                                      return Row(
                                        children: [
                                          Transform.scale(
                                            scale: 0.9,
                                            child: Radio(value: index, groupValue: controller.statusList[index]['isSelected'], onChanged: (value){
                                              for(var item in controller.statusList){
                                                item['isSelected'] = false;
                                              }
                                              controller.statusList[index]['isSelected'] = value;
                                              // print(index.toString());
                                              setState(() {});
                                            },
                                              fillColor: MaterialStateColor.resolveWith((states) => controller.statusList[index]['color']),
                                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                              activeColor: controller.statusList[index]['color'],
                                            ),
                                          ),
                                          Text(controller.statusList[index]['title'], style: Style.montserratBoldStyle().copyWith(fontSize: radioButtonTitleTs, color: controller.statusList[index]['color'])),
                                        ],
                                      );
                                    }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: BaseButton(removeHorizontalPadding: true,btnType: dialogButton,title: translate(Get.context!).submit_btn_txt,
                        onPressed: (){
                           if (type.toLowerCase() == "other") {
                             type = reasonController.text.trim();
                           }
                           controller.changeStarsAttendanceStatus(index: widget.index, attendanceType: type, reason: type, updateQRList: true, starId: controller.qrSearchedList?[widget.index].sId??"");
                           controller.qrSearchedList?[widget.index].sId??"";
                    }, btnWidth: 35.w),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
