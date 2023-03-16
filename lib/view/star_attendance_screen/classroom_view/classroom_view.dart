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
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/absent_view.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/classroom_view_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/late_view.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/persent_view.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen_ctrl.dart';

class ClassRoomView extends StatefulWidget {
  const ClassRoomView({Key? key}) : super(key: key);

  @override
  State<ClassRoomView> createState() => _ClassRoomViewState();
}

class _ClassRoomViewState extends State<ClassRoomView> with SingleTickerProviderStateMixin{
  StarAttendanceScreenCtrl controller = Get.put(StarAttendanceScreenCtrl());

  @override
  void initState() {
    controller.tabCtrl = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        child: Column(
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
                              Text("Classroom", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                  CustomTextField(
                    controller: controller.searchCtrl,
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
              height: 1.5.h,
            ),
            Obx((){
              return controller.selectedIndex.value == 0 ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.fmoImageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      // mainAxisSpacing: 15,
                      mainAxisExtent: 42
                  ),
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: () {
                          controller.selectedFMOPos.value = index;
                        },
                        child: Obx(() {
                          return Container(
                            height: 40,
                            // padding: const EdgeInsets.symmetric(horizontal: 9),
                            decoration: BoxDecoration(
                                color: controller.selectedFMOPos.value == index
                                    ? CustomColors.backgroundColor
                                    : CustomColors.white,
                                boxShadow: [getBoxShadow()],
                                border: controller.selectedFMOPos.value == index
                                    ? Border.all(
                                    color: CustomColors.primaryColor, width: 1.5)
                                    : null,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: CustomColors.white, width: 2),
                                      shape: BoxShape.circle,
                                      boxShadow: [getBoxShadow()],
                                      color: controller.selectedFMOPos.value == index
                                          ? CustomColors.primaryColor
                                          : CustomColors.borderColor
                                  ),
                                  child: Icon(Icons.check, color: CustomColors.white,
                                      size: 17.sp),
                                ),
                                Obx(() => SvgPicture.asset(controller.fmoImageList[index],height: 30,color: controller.selectedFMOPos.value==index ? CustomColors.primaryColor:Colors.black,))
                              ],
                            ),
                          );
                        }),
                      )) : SizedBox();
            }),
            SizedBox(
              height: 1.5.h,
            ),
            Obx(() {
              if(controller.selectedFMOPos.value != 2){
                return Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: buildTabBar()),
                          Obx((){
                            return controller.selectedFMOPos.value == 1 ? Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SvgPicture.asset(qrCodeSvg, height: 25.sp,),
                            ) : SizedBox();
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller.tabCtrl,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            PresentView(),
                            AbsentView(),
                            LateView(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }else{
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: CustomColors.primaryColor,
                              value: controller.isRulesChecked.value,
                              side: BorderSide(color: CustomColors.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              onChanged: (bool? value) {
                                controller.isRulesChecked.value = value!;
                                setState(() {});
                              },
                            ),
                            Text(translate(context).select_all),
                          ],
                        ),
                        ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Stack(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                alignment: Alignment.centerLeft,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      showGeneralDialog(
                                        context: context,
                                        pageBuilder: (context, animation, secondaryAnimation) {
                                          return ConfirmationDialog(msg: translate(context).are_you_sure_youve_selected_present_stars,isShowBtn: true,);
                                        },
                                      );
                                    },
                                    child: Obx(() => Container(
                                      margin: const EdgeInsets.only(left: 15, right: 15.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: controller.selectedFMOPos1.value == index ? CustomColors.primaryColor : CustomColors.borderColor)),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: BorderDirectional(
                                                    end: BorderSide(width: 1,color: controller.selectedFMOPos1.value == index ? CustomColors.primaryColor : CustomColors.borderColor)
                                                )),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(12.0,8,8,8),
                                              child: Row(
                                                children: [

                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(15),
                                                            border: Border.all(
                                                                color: CustomColors.primaryColor)),
                                                        child:SvgPicture.asset(girlSvg),
                                                      ),
                                                      SizedBox(width: 2.w),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Roma #21', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.primaryColor),),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Wrap(
                                                            children: List.generate(controller.statusList.length, (index) {
                                                              return Row(
                                                                children: [
                                                                  Transform.scale(
                                                                    scale: 0.6,
                                                                    child: Radio(value: index, groupValue: controller.statusList[index]['isSelected'], onChanged: (value){
                                                                      for(var item in controller.statusList){
                                                                        item['isSelected'] = false;
                                                                      }
                                                                      controller.statusList[index]['isSelected'] = value;
                                                                      setState(() {});
                                                                    },
                                                                      splashRadius: 1.0,
                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                      fillColor: MaterialStateColor.resolveWith((states) => controller.statusList[index]['color']),
                                                                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                                                      activeColor: controller.statusList[index]['color'],
                                                                    ),
                                                                  ),
                                                                  Text(controller.statusList[index]['title'], style: Style.montserratBoldStyle().copyWith(fontSize: 12.sp, color: controller.statusList[index]['color']),),
                                                                ],
                                                              );
                                                            }),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(width: 10.w,),
                                                      // Column(
                                                      //   children: [
                                                      //     Text('Present', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.green),),
                                                      //     SizedBox(
                                                      //       height: 0.5.h,
                                                      //     ),
                                                      //     Text('7:30 am', style: Style.montserratMediumStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor),),
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(chatSvg1,),
                                                  SizedBox(height:1.1.h),
                                                  Text(translate(context).chat_with_parents,style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: Color(0xff686868), ),textAlign: TextAlign.center,),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    // child: Container(
                                    //   padding: EdgeInsets.all(3),
                                    //   decoration: BoxDecoration(
                                    //       color: Colors.white,
                                    //       shape: BoxShape.circle,
                                    //       boxShadow: [
                                    //         getBoxShadow()
                                    //       ]
                                    //   ),
                                    //   child: SvgPicture.asset(starSvg, height: 18.sp,),
                                    // ),
                                    child: InkWell(
                                      onTap: (){
                                        controller.selectedFMOPos1.value = index;
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        // padding: const EdgeInsets.symmetric(horizontal: 9),
                                        decoration: BoxDecoration(
                                            color: controller.selectedFMOPos1.value == index
                                                ? CustomColors.backgroundColor
                                                : CustomColors.borderColor,
                                            boxShadow: [getLightBoxShadow()],
                                            border: controller.selectedFMOPos1.value == index
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
                                              color: controller.selectedFMOPos1.value == index
                                                  ? CustomColors.primaryColor
                                                  : CustomColors.borderColor
                                          ),
                                          child: Center(
                                            child: Icon(Icons.check, color: CustomColors.white,
                                                size: 16.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 3.0),
                                      child: InkWell(
                                        onTap: (){
                                          Get.to(PerformanceScreen(index: 2,));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                getBoxShadow()
                                              ]
                                          ),
                                          child: SvgPicture.asset(starSvg, height: 18.sp,),
                                        ),
                                      ),
                                      // child: Container(
                                      //   height: 20,
                                      //   width: 20,
                                      //   // padding: const EdgeInsets.symmetric(horizontal: 9),
                                      //   decoration: BoxDecoration(
                                      //       color: controller.selectedFMOPos.value == index
                                      //           ? CustomColors.backgroundColor
                                      //           : CustomColors.borderColor,
                                      //       boxShadow: [getLightBoxShadow()],
                                      //       border: controller.selectedFMOPos.value == index
                                      //           ? Border.all(
                                      //           color: CustomColors.primaryColor, width: 1.5)
                                      //           : Border.all(
                                      //           color: Colors.transparent, width: 1.5),
                                      //       borderRadius: BorderRadius.circular(30.0)),
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //         border: Border.all(
                                      //             color: CustomColors.white, width: 1.5),
                                      //         shape: BoxShape.circle,
                                      //         boxShadow: [getBoxShadow()],
                                      //         color: controller.selectedFMOPos.value == index
                                      //             ? CustomColors.primaryColor
                                      //             : CustomColors.borderColor
                                      //     ),
                                      //     child: Center(
                                      //       child: Icon(Icons.check, color: CustomColors.white,
                                      //           size: 16.sp),
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: CustomButton(text: translate(context).present.toUpperCase(), onPressed: (){}, borderRadius: 10.0,btnHeight: 40),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Flexible(
                              flex: 1,
                              child: CustomButton(text: translate(context).late.toUpperCase(), onPressed: (){}, borderRadius: 10.0,btnHeight: 40),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Flexible(
                              flex: 1,
                              child: CustomButton(text: translate(context).late.toUpperCase(), onPressed: (){}, borderRadius: 10.0,btnHeight: 40,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: controller.tabCtrl,
        padding: const EdgeInsets.all(4),
        labelPadding: EdgeInsets.only(left: 10, right: 10),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
          Tab(
            text: translate(context).present,
          ),
          Tab(
            text: translate(context).absent,
          ),
          Tab(
            text: translate(context).late,
          ),
        ],
      ),
    );
  }
}
