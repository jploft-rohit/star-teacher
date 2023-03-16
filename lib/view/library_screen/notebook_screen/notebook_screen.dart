import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_screen/notebook_screen/add_todo_note.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_detail_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';

class NoteBookScreen extends StatefulWidget {
  const NoteBookScreen({Key? key}) : super(key: key);

  @override
  State<NoteBookScreen> createState() => _NoteBookScreenState();
}

class _NoteBookScreenState extends State<NoteBookScreen> {
  NotebookScreenCtrl controller = Get.put(NotebookScreenCtrl());
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
              Get.to(AddToDoNote());
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
              Row(
                children: [
                  Obx(() => Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        controller.selectedIndex.value = 0;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: controller.selectedIndex.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex.value == 0)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text("Stars", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                        controller.selectedIndex.value = 1;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: controller.selectedIndex.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex.value == 1)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text("My Notes", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              // if(controller.selectedIndex.value == 0) ...[
              //   buildStarsView(),
              // ] else ...[
              //   buildNotesView()
              // ]
              Obx((){
                return controller.selectedIndex.value == 0 ? buildStarsView() :buildNotesView();
              })
            ],
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
                          Text("H1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                child: Row(
                  children: [
                    SvgPicture.asset(jobDetailSvg,height: 15,),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text("Term 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                    Spacer(),
                    Icon(
                      Icons.arrow_drop_down,
                    )
                  ],
                ),
              ),
              Divider(height: 0.0,),
              CustomTextField(
                controller: TextEditingController(),
                hintText: translate(context).search_by_id,
                borderColor: Colors.transparent,
                hintTextColor: CustomColors.textLightGreyColor,
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
          height: 2.h,
        ),
        ListView.builder(
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Get.to(NotebookDetailScreen());
              },
              child: Container(
                padding: EdgeInsets.all(15.sp),
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: CustomColors.borderColor)
                ),
                child: Row(
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
                          height: .2.h,
                        ),
                        Text("#562665", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                        SizedBox(
                          height: .2.h,
                        ),
                        Container(
                          width: 30.w,
                          height: 1,
                          color: CustomColors.borderColor,
                        ),
                        SizedBox(
                          height: .2.h,
                        ),
                        Row(
                          children: [
                            Text("Last Comment Date : ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                            Text("25/07/2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                          ],
                        ),
                        SizedBox(
                          height: .2.h,
                        ),
                        Container(
                          width: 30.w,
                          height: 1,
                          color: CustomColors.borderColor,
                        ),
                        SizedBox(
                          height: .2.h,
                        ),
                        Row(
                          children: [
                            Text("Total Notes : ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                            Text("35", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
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
    );
  }

  Widget buildNotesView() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: List.generate(4, (index){
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: index == 2 || index == 3 ? Color(0xffFFF7AA) : Color(0xffFFE7E9),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 4,
                color: index == 2 || index == 3 ? Color(0xffFDD900) : Color(0xffE54345),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText("To-do list", 15.sp, CustomColors.textBlackColor, FontWeight.w700),
                        Row(
                          children: [
                            Image.asset(editPng, height: 15.0,),
                            SizedBox(
                              width: 2.w,
                            ),
                            SvgPicture.asset("assets/images/delete 4.svg"),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        MyBullet(),
                        SizedBox(
                          width: 2.w,
                        ),
                        addText("Hang washing", 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        MyBullet(),
                        SizedBox(
                          width: 2.w,
                        ),
                        addText("Hang washing", 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        MyBullet(),
                        SizedBox(
                          width: 2.w,
                        ),
                        addText("Hang washing", 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
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
