import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_record/library_record_controller.dart';
import 'package:staff_app/view/library_record/sub_pages/book_isssue_request_view.dart';
import 'package:staff_app/view/library_record/sub_pages/incustody_view.dart';
import 'package:staff_app/view/library_record/sub_pages/requested_view.dart';
import 'package:staff_app/view/library_record/sub_pages/return_view.dart';


class LibraryRecordsView extends StatefulWidget {
  const LibraryRecordsView({super.key});

  @override
  State<LibraryRecordsView> createState() => _LibraryRecordsViewState();
}

class _LibraryRecordsViewState extends State<LibraryRecordsView> {
  LibraryRecordsController controller = Get.put(LibraryRecordsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, "Library Record", [
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
            Get.to(BookIssueView());
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
        Text("Book Issue\nRequest", style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),textAlign: TextAlign.center,)
      ],
    ),
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
                              Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
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
            SizedBox(height: 2.h),
            buildTabBar(),
            SizedBox(height: 1.h),
            Expanded(
              child: TabBarView(
                controller: controller.libraryRecordsController,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  RequestedView(),
                  InCustodyView(),
                  ReturnView(),
                ],
              ),
            ),
            SizedBox(height: 3.h)
          ],
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 4),
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        boxShadow: [
          getBoxShadow()
        ]
      ),
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        controller: controller.libraryRecordsController,
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: TextStyle(
            fontSize: 15.sp, fontWeight: FontWeight.w400),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 15.sp),
        tabs: [
          Tab(
            text: 'Requested '.tr,
          ),
          Tab(
            text: 'In custody '.tr,
          ),
          Tab(
            text: 'Returned'.tr,
          ),
        ],
      ),
    );
  }
}
