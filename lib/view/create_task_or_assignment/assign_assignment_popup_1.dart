import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment_screen_ctrl.dart';

import '../../Utility/filter_textformfield.dart';

class AssignAssignmentPopup1 extends StatefulWidget {
  const AssignAssignmentPopup1({Key? key}) : super(key: key);

  @override
  State<AssignAssignmentPopup1> createState() => _AssignAssignmentPopup1State();
}

class _AssignAssignmentPopup1State extends State<AssignAssignmentPopup1> {
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
                    const Text(""),
                    Text("Assigned To", style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black))
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialGrade,
                            hintText: 'Grade 3',
                            listData: DummyLists.gradeData,
                            onChange: (value) {
                              setState(() {
                                DummyLists.initialGrade = value;
                              });
                            },
                            icon: classTakenSvg,
                          ),
                          Container(
                            child: VerticalDivider(
                              width: 1,
                            ),
                            height: 4.h,
                            width: 1,
                          ),
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialClass,
                            hintText: 'H1',
                            listData: DummyLists.classData,
                            onChange: (value) {
                              setState(() {
                                DummyLists.initialClass = value;
                              });
                            },
                            icon: classTakenSvg,
                          ),
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialTerm,
                            hintText: 'Term 1',
                            listData: DummyLists.termData,
                            onChange: (value) {
                              setState(() {
                                DummyLists.initialTerm = value;
                              });
                            },
                            icon: jobDetailSvg,
                          ),
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      FilterTextFormField(
                        onChange: (String val) {},
                        hintText: "Search Star,ID...",
                        keyBoardType: TextInputType.name,
                      ),
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
                            (states) => const BorderSide(width: 1.0, color: BaseColors.primaryColor),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: const BorderSide(color: BaseColors.primaryColor)
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
                                        Text("#562665", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
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
