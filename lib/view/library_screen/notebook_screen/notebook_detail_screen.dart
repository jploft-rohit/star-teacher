import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/library_screen/notebook_screen/add_note_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';

class NotebookDetailScreen extends StatefulWidget {
  const NotebookDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotebookDetailScreen> createState() => _NotebookDetailScreenState();
}

class _NotebookDetailScreenState extends State<NotebookDetailScreen> {
  NotebookScreenCtrl controller = Get.find<NotebookScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, "Notebook", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              Get.to(AddNoteScreen());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: CustomColors.primaryColor,
            ),
          ),
          Text("Add Note", style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: CustomColors.borderColor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: CustomColors.primaryColor)
                          ),
                          child: SvgPicture.asset(girlSvg, height: 6.h,),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sania", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                            SizedBox(
                              height: .2.h,
                            ),
                            Container(
                              width: 30.w,
                              height: 1,
                              color: CustomColors.borderColor,
                            ),
                            SizedBox(
                              height: .3.h,
                            ),
                            Text("#562665", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                            SizedBox(
                              height: .3.h,
                            ),
                            Container(
                              width: 30.w,
                              height: 1,
                              color: CustomColors.borderColor,
                            ),
                            SizedBox(
                              height: .2.h,
                            ),
                            Text("G3-H1", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: (){
                          showScanQrDialogue(context, false);
                        },
                        child: SvgPicture.asset(qrCodeSvg))
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Obx(() => Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        controller.selectedIndex1.value = 0;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex1.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: controller.selectedIndex1.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex1.value == 0)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text("Has Talent", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Obx(() => Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        controller.selectedIndex1.value = 1;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex1.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: controller.selectedIndex1.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex1.value == 1)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text("Need Improvement", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                itemCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    addText("Title: ", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                                    addText("Extra classes for her", 16.sp, CustomColors.primaryColor, FontWeight.w700),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.delete,
                                      color: CustomColors.primaryColor,
                                      size: 18.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: Image.asset(editPng, color: CustomColors.primaryColor,height: 18.sp,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                buildInfoItems("Grade", "5th"),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 20.0,
                                  width: 1,
                                  color: CustomColors.borderColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                                SizedBox(
                                  width: 2.w,
                                ),
                                buildInfoItems("Date", "07/07/2022"),
                              ],
                            ),
                            Divider(),
                            buildInfoItems("Description", "This star has good dance skills, so I recommend extra classes for her to improve more."),
                            Divider(),
                            buildInfoItems("Teacher", "Ovaish Khan"),
                            Divider(),
                            buildInfoItems("Subject", "Science"),
                            Divider(),
                            buildInfoItems("Comment", "Lorem Ipsum is simply dummy text..."),
                            Divider(),
                            buildInfoItems("Recommendation", "Dance"),

                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
