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

import '../../Utility/filter_textformfield.dart';

class SelectStarPopup extends StatefulWidget {
  String type;
  SelectStarPopup({Key? key, required this.type}) : super(key: key);

  @override
  State<SelectStarPopup> createState() => _SelectStarPopupState();
}

class _SelectStarPopupState extends State<SelectStarPopup> {
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
                    Text(""),
                    Text( widget.type == "Star" ? "Select Stars" : "Medical Support", style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
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
                    children: [
                      widget.type=="medical"?
                      Row(
                        children: [
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialRole, hintText: 'Select Role',
                            listData: DummyLists.roleData, onChange: (value) {
                            setState(() {
                              DummyLists.initialGrade=value;
                            });
                          },icon: classTakenSvg,),
                        ],
                      )
                          :Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          CustomFilterDropDown(
                            initialValue: DummyLists.initialGrade, hintText: 'Grade 3',
                            listData: DummyLists.gradeData, onChange: (value) {
                            setState(() {
                              DummyLists.initialGrade=value;
                            });
                          },icon: classTakenSvg,),
                          Container(child: VerticalDivider(width: 1,),height: 4.h,width: 1,),
                          CustomFilterDropDown(
                            initialValue: DummyLists.initialClass, hintText: 'H1',
                            listData: DummyLists.categoryData, onChange: (value) {
                            setState(() {
                              DummyLists.initialClass=value;
                            });
                          },icon: classTakenSvg,),
                        ],
                      ),
                      Divider(height: 1,thickness: 1,),
                      FilterTextFormField(onChange: (String val) {
                      }, hintText: "Search Star,ID...", keyBoardType: TextInputType.name,
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
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
                              borderRadius: BorderRadius.circular(15.0),
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
                                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                                    margin: EdgeInsets.only(left: 3,top: 3,bottom: 3),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: BaseColors.primaryColor
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: SvgPicture.asset(manSvg,height: 5.h,width: 5.h,),
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
                                        Text("#632541", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
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
                                          color: Colors.white, width: 1.5)
                                          : Border.all(
                                          color: Colors.white, width: 1.5),
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [getLightBoxShadow()],
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
                  child: BaseButton(btnType: mediumLargeButton,title: "CONTINUE", onPressed: (){
                    Get.back();
                  },  borderRadius: 20,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
