import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
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
      appBar: appBarWithAction(context, "Library", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
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
                physics: NeverScrollableScrollPhysics(),
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
    return Container(
      height: 35,
      width: 100.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        labelStyle: Style.montserratRegularStyle().copyWith(fontSize: 12),
        onTap: (value){

        },
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
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
      ),
    );
  }

  Widget buildAssessmentView() {
    return Column(
      children: [
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
                          Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset(classTakenSvg,height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Terms 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Row(
                        children: [
                          SvgPicture.asset(jobDetailSvg,height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset("assets/images/book 2.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Math", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/user.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Gender", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset("assets/images/user.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Ahmed", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                    style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Aptitude Test", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/copy 3.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Term", "Term 1")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(jobDetailSvg, height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Grade", "Grade 3")
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/document 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Subject", "Math")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/user.svg", height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Created By", "Ahmed")
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/gender-fluid 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Gender", "Male")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Created On", "07/07/2022")
                      ],
                    ),
                  ],
                ),
                Divider(),
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),

                    CustomButton(text: "Reuse", onPressed: (){}, btnHeight: 22,btnWidth: 20.w,textSize: 14.sp,),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'File : ',
                        style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: "apitude_test", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp, height: 1.2, decoration: TextDecoration.underline)),
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
                          Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset(classTakenSvg,height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Terms 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Row(
                        children: [
                          SvgPicture.asset(jobDetailSvg,height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset("assets/images/book 2.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Math", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/user.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Gender", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset("assets/images/user.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Ahmed", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                    style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Mental Health", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/copy 3.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Term", "Term 1")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(jobDetailSvg, height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Grade", "Grade 3")
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/document 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Subject", "Math")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/user.svg", height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Created By", "Ahmed")
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/gender-fluid 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Gender", "Male")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Created On", "07/07/2022")
                      ],
                    ),
                  ],
                ),
                Divider(),
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),

                    CustomButton(text: "Reuse", onPressed: (){}, btnHeight: 22,btnWidth: 20.w,textSize: 14.sp,),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'File : ',
                        style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: "Mental Health", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp, height: 1.2, decoration: TextDecoration.underline)),
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
                          Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset(classTakenSvg,height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Terms 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Row(
                        children: [
                          SvgPicture.asset(jobDetailSvg,height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset("assets/images/book 2.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Math", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/user.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Gender", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                          SvgPicture.asset("assets/images/user.svg",height: 15,),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Ahmed", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                    style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Connect the Dots", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/copy 3.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Term", "Term 1")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(jobDetailSvg, height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Grade", "Grade 3")
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/document 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Subject", "Math")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/user.svg", height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Created By", "Ahmed")
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/gender-fluid 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Gender", "Male")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Created On", "07/07/2022")
                      ],
                    ),
                  ],
                ),
                Divider(),
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),

                    CustomButton(text: "Reuse", onPressed: (){
                      Get.to(NoteBookScreen());
                    }, btnHeight: 22,btnWidth: 20.w,textSize: 14.sp,),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'File : ',
                        style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: "Connect the Dots", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp, height: 1.2, decoration: TextDecoration.underline)),
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
