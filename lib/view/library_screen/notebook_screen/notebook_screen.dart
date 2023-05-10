import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_screen/notebook_screen/add_todo_note.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_detail_screen.dart';
import 'package:staff_app/view/library_screen/ctrl/notebook_ctrl.dart';

class NoteBookScreen extends StatefulWidget {
  const NoteBookScreen({Key? key}) : super(key: key);

  @override
  State<NoteBookScreen> createState() => _NoteBookScreenState();
}

class _NoteBookScreenState extends State<NoteBookScreen> with SingleTickerProviderStateMixin{
  NotebookCtrl controller = Get.put(NotebookCtrl());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const BaseAppBar(title: "Notebook"),
        // floatingActionButton: BaseFloatingActionButton(
        //   onTap: () {Get.to(const AddToDoNote());},
        //   title: 'Add Note',
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                buildStarsView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStarsView() {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: ColorConstants.borderColor
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomFilterDropDown(
                      initialValue: DummyLists.initialSchool,
                      hintText: 'School',
                      listData: DummyLists.schoolData,
                      onChange: (value) {
                        setState(() {
                          DummyLists.initialSchool = value;
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
                FilterTextFormField(
                  onChange: (String val) {},
                  hintText: "Search Star,ID...",
                  keyBoardType: TextInputType.name,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          ListView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(const NotebookDetailScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: BaseColors.borderColor)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: BaseColors.primaryColor)
                        ),
                        child: SvgPicture.asset(girlSvg, height: 6.h),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sania", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                          SizedBox(
                            height: .5.h,
                          ),
                          Container(
                            width: 30.w,
                            height: 1,
                            color: BaseColors.borderColor,
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Text("#562665", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          SizedBox(
                            height: .5.h,
                          ),
                          Container(
                            width: 30.w,
                            height: 1,
                            color: BaseColors.borderColor,
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Row(
                            children: [
                              Text("Last Comment Date : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                              Text("25/07/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Container(
                            width: 30.w,
                            height: 1,
                            color: BaseColors.borderColor,
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Row(
                            children: [
                              Text("Total Notes : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                              Text("35", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );}
}

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}
