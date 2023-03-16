import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_record/library_record_controller.dart';

class BookIssueView extends StatefulWidget {
  const BookIssueView({super.key});

  @override
  State<BookIssueView> createState() => _BookIssueViewState();
}

class _BookIssueViewState extends State<BookIssueView> {
  LibraryRecordsController controller = Get.put(LibraryRecordsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, "Book Issue Request", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text("Grade 2", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("H 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                              Text("Subject", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
                    controller: TextEditingController(),
                    hintText: translate(context).search_by_id,
                    hintTextColor: CustomColors.textLightGreyColor,
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
            SizedBox(height: 2.h),
            Obx(
              () => bookIssuseToogleButton(
                  () {
                    controller.typeAselected();
                  },
                  controller.isTypeA.value,
                  () {
                    controller.typeBselected();
                  },
                  controller.isTypeB.value,
                  () {
                    controller.typeCselected();
                  },
                  controller.isTypeC.value,
                  () {
                    controller.typeDselected();
                  },
                  controller.isTypeD.value),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) => Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Obx(() => GestureDetector(
                            onTap: () {
                              controller.selectedIndex.value = index;
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 5, right: 5, left: 13),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(color: controller.selectedIndex.value == index ? CustomColors.primaryColor : Colors.transparent),
                                  boxShadow: kElevationToShadow[2],
                                  color: CustomColors.white),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  SizedBox(width: 1.h),
                                  Image.asset(
                                    'assets/images/Rectangle 704.png',
                                  ),
                                  SizedBox(width: 1.h),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        addText(
                                            'General Knowledge by Dr. Rafiq',
                                            16.sp,
                                            CustomColors.textBlackColor,
                                            FontWeight.w500),
                                        SizedBox(height: 0.5.h),
                                        Text(
                                          'General Knowledge is the High Score Series Book to acquire latest knowledge about the Current Affairs, History, Geography',
                                          style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: CustomColors.textLightGreyColor),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          Obx(() => Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        controller.selectedIndex.value == index
                                            ? CustomColors.primaryColor
                                            : CustomColors.greyColor,
                                    boxShadow: [getBoxShadow()],
                                    border: Border.all(
                                        color: CustomColors.white, width: 2)),
                                child: const Icon(
                                  Icons.check,
                                  color: CustomColors.white,
                                  size: 20,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(controller: TextEditingController(), hintText: "Message", maxLine: 3,),
                    SizedBox(height: 2.h),
                    CustomButton(text: "SUBMIT", onPressed: (){})
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget bookIssuseToogleButton(
      onTap1, istypeA, onTap2, istypeB, onTap3, istypeC, onTap4, istypeD) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap1,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: istypeA
                          ? Colors.transparent
                          : CustomColors.borderColor),
                  color: istypeA
                      ? CustomColors.backgroundColor
                      : CustomColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: istypeA ? kElevationToShadow[3] : null),
              child: istypeA
                  ? addText(
                  'Type A', 14, CustomColors.primaryColor, FontWeight.w700)
                  : addText('Type A', 14, CustomColors.textLightGreyColor, FontWeight.w400),
            ),
          ),
        ),
        SizedBox(width: 0.7.h),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap2,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: istypeB ? kElevationToShadow[3] : null,
                  color: istypeB
                      ? CustomColors.backgroundColor
                      : CustomColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: istypeB
                          ? Colors.transparent
                          : CustomColors.borderColor)),
              child: istypeB
                  ? addText(
                  'Type B', 14, CustomColors.primaryColor, FontWeight.w700)
                  : addText('Type B', 14, CustomColors.textLightGreyColor, FontWeight.w400),
            ),
          ),
        ),
        SizedBox(width: 0.7.h),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap3,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: istypeC ? kElevationToShadow[3] : null,
                  color: istypeC
                      ? CustomColors.backgroundColor
                      : CustomColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: istypeC
                          ? Colors.transparent
                          : CustomColors.borderColor)),
              child: istypeC
                  ? addText(
                  'Type C', 14, CustomColors.primaryColor, FontWeight.w700)
                  : addText('Type C', 14, CustomColors.textLightGreyColor, FontWeight.w400),
            ),
          ),
        ),
        SizedBox(width: 0.7.h),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap4,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: istypeD ? kElevationToShadow[3] : null,
                  color: istypeD
                      ? CustomColors.backgroundColor
                      : CustomColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: istypeD
                          ? Colors.transparent
                          : CustomColors.borderColor)),
              child: istypeD
                  ? addText(
                  'Type D', 14, CustomColors.primaryColor, FontWeight.w700)
                  : addText('Type D', 14, CustomColors.textLightGreyColor, FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
