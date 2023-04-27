import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> with SingleTickerProviderStateMixin {
  TabController? tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Library"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: [
                  buildAssessmentView(),
                  buildCoursesView(),
                  buildWorksheetsView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs:  const [
        Tab(
          text: 'Assessments',
        ),
        Tab(
          text: 'Courses',
        ),
        Tab(
          text: 'Worksheets',
        ),
      ],
    );
  }

  Widget buildAssessmentView() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFCECECE), width: 1)),
          child: Column(
            children: [
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'School', listData: DummyLists.schoolData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value;
                    });
                  },icon: classTakenSvg,
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialTerm, hintText: 'Terms 1', listData: DummyLists.termData, onChange: (value) {
                    setState(() {
                      DummyLists.initialTerm=value;
                    });
                  },icon: classTakenSvg,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialGrade, hintText: 'Grade 3', listData: DummyLists.schoolData, onChange: (value) {
                    setState(() {
                      DummyLists.initialGrade=value;
                    });
                  },icon: jobDetailSvg,
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialSubject, hintText: 'Math', listData: DummyLists.subjectData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSubject=value;
                    });
                  },icon: "assets/images/book 2.svg",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'Gender', listData: DummyLists.genderData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value;
                    });
                  },icon: "assets/images/user.svg",
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialteacherName, hintText: 'Ahmed', listData: DummyLists.teacherNameData, onChange: (value) {
                    setState(() {
                      DummyLists.initialteacherName=value;
                    });
                  },icon: "assets/images/user.svg",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Title : ',
                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Aptitude Test", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/copy 3.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems("Term", "Term 1")
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(jobDetailSvg, height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems("Grade", "Grade 3")
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/document 1.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Subject", "Math"))
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/user.svg", height: 15,),
                          SizedBox(width: 2.w),
                          Expanded(child: buildInfoItems("Created By", "Ahmed"))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/gender-fluid 1.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Gender", "Male"))
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Created On", "07/07/2022"))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/copy 3.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Doc No", "A0082")
                      ],
                    ),
                    Container(height: 20.0,width: 1, color: BaseColors.borderColor),

                    BaseButton(btnType: toggleButton,title: "Reuse", onPressed: (){}, textSize: 13.sp,verticalPadding: 0.8.h,),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'File : ',
                        style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: "apitude_test", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2, decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget buildCoursesView() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFCECECE), width: 1)),
          child: Column(
            children: [
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'School', listData: DummyLists.schoolData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value;
                    });
                  },icon: classTakenSvg,
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialTerm, hintText: 'Terms 1', listData: DummyLists.termData, onChange: (value) {
                    setState(() {
                      DummyLists.initialTerm=value;
                    });
                  },icon: classTakenSvg,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialGrade, hintText: 'Grade 3', listData: DummyLists.schoolData, onChange: (value) {
                    setState(() {
                      DummyLists.initialGrade=value;
                    });
                  },icon: jobDetailSvg,
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialSubject, hintText: 'Math', listData: DummyLists.subjectData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSubject=value;
                    });
                  },icon: "assets/images/book 2.svg",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'Gender', listData: DummyLists.genderData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value;
                    });
                  },icon: "assets/images/user.svg",
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialteacherName, hintText: 'Ahmed', listData: DummyLists.teacherNameData, onChange: (value) {
                    setState(() {
                      DummyLists.initialteacherName=value;
                    });
                  },icon: "assets/images/user.svg",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Title : ',
                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Aptitude Test", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/copy 3.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems("Term", "Term 1")
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(jobDetailSvg, height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems("Grade", "Grade 3")
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/document 1.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Subject", "Math"))
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/user.svg", height: 15,),
                          SizedBox(width: 2.w),
                          Expanded(child: buildInfoItems("Created By", "Ahmed"))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/gender-fluid 1.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Gender", "Male"))
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Created On", "07/07/2022"))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/copy 3.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Doc No", "C0082")
                      ],
                    ),
                    Container(height: 20.0,width: 1, color: BaseColors.borderColor),

                    BaseButton(btnType: toggleButton,title: "Reuse", onPressed: (){}, textSize: 13.sp,verticalPadding: 0.8.h,),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'File : ',
                        style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: "apitude_test", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2, decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget buildWorksheetsView() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFCECECE), width: 1)),
          child: Column(
            children: [
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'School', listData: DummyLists.schoolData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value;
                    });
                  },icon: classTakenSvg,
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialTerm, hintText: 'Terms 1', listData: DummyLists.termData, onChange: (value) {
                    setState(() {
                      DummyLists.initialTerm=value;
                    });
                  },icon: classTakenSvg,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialGrade, hintText: 'Grade 3', listData: DummyLists.schoolData, onChange: (value) {
                    setState(() {
                      DummyLists.initialGrade=value;
                    });
                  },icon: jobDetailSvg,
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialSubject, hintText: 'Math', listData: DummyLists.subjectData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSubject=value;
                    });
                  },icon: "assets/images/book 2.svg",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'Gender', listData: DummyLists.genderData, onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value;
                    });
                  },icon: "assets/images/user.svg",
                  ),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 4.h,
                    width: 1,
                  ),
                  CustomFilterDropDown(initialValue: DummyLists.initialteacherName, hintText: 'Ahmed', listData: DummyLists.teacherNameData, onChange: (value) {
                    setState(() {
                      DummyLists.initialteacherName=value;
                    });
                  },icon: "assets/images/user.svg",
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Title : ',
                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Aptitude Test", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/copy 3.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems("Term", "Term 1")
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(jobDetailSvg, height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems("Grade", "Grade 3")
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/document 1.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Subject", "Math"))
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/user.svg", height: 15,),
                          SizedBox(width: 2.w),
                          Expanded(child: buildInfoItems("Created By", "Ahmed"))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/gender-fluid 1.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Gender", "Male"))
                        ],
                      ),
                    ),
                    Container(margin: EdgeInsets.symmetric(horizontal: 4.w),height: 20.0,width: 1, color: BaseColors.borderColor,),
                    Expanded(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(child: buildInfoItems("Created On", "07/07/2022"))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/copy 3.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Doc No", "W0082")
                      ],
                    ),
                    Container(height: 20.0,width: 1, color: BaseColors.borderColor),

                    BaseButton(btnType: toggleButton,title: "Reuse", onPressed: (){}, textSize: 13.sp,verticalPadding: 0.8.h,),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'File : ',
                        style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: "apitude_test", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2, decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
