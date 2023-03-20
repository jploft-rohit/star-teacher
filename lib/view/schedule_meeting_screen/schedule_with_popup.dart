import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment_screen_ctrl.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_with_popup1.dart';

class ScheduleWithPopup extends StatefulWidget {
  const ScheduleWithPopup({Key? key}) : super(key: key);

  @override
  State<ScheduleWithPopup> createState() => _ScheduleWithPopupState();
}

class _ScheduleWithPopupState extends State<ScheduleWithPopup> {
  TextEditingController searchCtrl = TextEditingController();

  int selectedFMOPos = 0;
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
                    Text("Select Role", style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: CustomColors.borderColor
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                              child: Row(
                                children: [
                                  SvgPicture.asset(classTakenSvg,height: 15,),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 25,
                            color: CustomColors.borderColor,
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(classTakenSvg,height: 15,),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text("H1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 0.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                        child: Row(
                          children: [
                            SvgPicture.asset(jobDetailSvg,height: 15,),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("Term 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_drop_down,
                            )
                          ],
                        ),
                      ),
                      const Divider(height: 0.0,),
                      CustomTextField(
                        controller: searchCtrl,
                        hintText: translate(context).search_by_id,
                        borderColor: Colors.transparent,
                        hintTextColor: CustomColors.textLightGreyColor,
                        contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: roleNames.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: InkWell(
                        onTap: (){
                          selectedFMOPos = index;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: selectedFMOPos == index ? CustomColors.backgroundColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: CustomColors.borderColor
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(roleNames[index], style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  // padding: const EdgeInsets.symmetric(horizontal: 9),
                                  decoration: BoxDecoration(
                                      color: selectedFMOPos == index
                                          ? CustomColors.backgroundColor
                                          : CustomColors.borderColor,
                                      boxShadow: [getLightBoxShadow()],
                                      border: selectedFMOPos == index
                                          ? Border.all(
                                          color: CustomColors.primaryColor, width: 1.5)
                                          : Border.all(
                                          color: Colors.transparent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: CustomColors.white, width: 1.5),
                                        shape: BoxShape.circle,
                                        boxShadow: [getBoxShadow()],
                                        color: selectedFMOPos == index
                                            ? CustomColors.primaryColor
                                            : CustomColors.borderColor
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check, color: CustomColors.white,
                                          size: 16.sp),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: CustomButton(text: "SAVE", onPressed: (){
                    Get.back();
                  }, btnWidth: 25.w,borderRadius: 50.0,btnHeight: 35,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<String> roleNames = [
    'Teacher',
    'Stars',
    'Parents',
  ];
}
