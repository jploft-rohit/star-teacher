import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
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
                    GestureDetector(
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Color(0xFFCECECE),width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialRole, hintText: 'Select Role',
                            listData: DummyLists.roleData, onChange: (value) {
                            setState(() {
                              DummyLists.initialRole=value;
                            });
                          },icon: classTakenSvg,),
                          Container(
                            child: VerticalDivider(
                              width: 1,
                            ),
                            height: 4.h,
                            width: 1,
                          ),
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialSubject, hintText: 'Select Subject',
                            listData: DummyLists.subjectData, onChange: (value) {
                            setState(() {
                              DummyLists.initialSubject=value;
                            });
                          },icon: jobDetailSvg,),
                        ],
                      ),
                      Divider(height: 1,thickness: 1,),
                      FilterTextFormField
                        (onChange: (String val) {
                      }, hintText: "Search by ID....", keyBoardType: TextInputType.name,
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
                      checkColor: BaseColors.primaryColor,
                      activeColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: ctrl.isChecked.value,
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(width: 1.0, color: BaseColors.primaryColor),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(color: BaseColors.primaryColor)
                      ),
                      onChanged: (bool? value) {
                        ctrl.isChecked.value = value!;
                      },
                    ),),
                    Text('Select All', style: Style.montserratMediumStyle().copyWith(color: BaseColors.greyColor, fontSize: 15.sp),),
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
                      child: GestureDetector(
                        onTap: (){
                          selectedFMOPos = index;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedFMOPos == index ? BaseColors.backgroundColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: BaseColors.borderColor
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
                                          color: BaseColors.primaryColor
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
                                        Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
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
                                          ? BaseColors.backgroundColor
                                          : BaseColors.borderColor,
                                      boxShadow: [getLightBoxShadow()],
                                      border: selectedFMOPos == index
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
                                        color: selectedFMOPos == index
                                            ? BaseColors.primaryColor
                                            : BaseColors.borderColor
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check, color: BaseColors.white,
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
                  child: BaseButton(btnType: dialogButton,title: "SAVE", onPressed: (){
                    Get.back();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
