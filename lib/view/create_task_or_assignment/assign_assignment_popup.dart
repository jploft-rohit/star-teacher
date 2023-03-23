import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment_screen_ctrl.dart';

class AssignAssignmentPopup extends StatefulWidget {
  const AssignAssignmentPopup({Key? key}) : super(key: key);

  @override
  State<AssignAssignmentPopup> createState() => _AssignAssignmentPopupState();
}

class _AssignAssignmentPopupState extends State<AssignAssignmentPopup> {
  TextEditingController searchCtrl = TextEditingController();
  CreateTaskOrAssignmentScreenCtrl ctrl = Get.find<CreateTaskOrAssignmentScreenCtrl>();

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
                    Text(""),
                    Text("Assigned To", style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
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
                                  Text("Select Role", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                  Spacer(),
                                  Icon(
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
                                    SvgPicture.asset(jobDetailSvg,height: 15,),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("Select Subject", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_drop_down,
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      Divider(height: 0.0,),
                      CustomTextField(
                        controller: searchCtrl,
                        hintText: "Search By ID...",
                        borderColor: Colors.transparent,
                        contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => Checkbox(
                      checkColor: CustomColors.primaryColor,
                      activeColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: ctrl.isChecked.value,
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(width: 1.0, color: CustomColors.primaryColor),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(color: CustomColors.primaryColor)
                      ),
                      onChanged: (bool? value) {
                        ctrl.isChecked.value = value!;
                      },
                    ),),
                    Text('Select All', style: Style.montserratMediumStyle().copyWith(color: CustomColors.greyColor, fontSize: 15.sp),),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
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
                          decoration: BoxDecoration(
                              color: selectedFMOPos == index ? CustomColors.backgroundColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: CustomColors.borderColor
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: CustomColors.primaryColor
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: SvgPicture.asset(manSvg,height: 25,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Row(
                                          children: [
                                            buildInfoItems("Subject", "English"),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            buildInfoItems("ID", "#562356"),
                                          ],
                                        ),
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
                  child: BaseButton(title: "SAVE", onPressed: (){
                    Get.back();
                  }, btnWidth: 25.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
