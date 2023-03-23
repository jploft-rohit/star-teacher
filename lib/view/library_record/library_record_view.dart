import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
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
      appBar: const BaseAppBar(title: "Library Record"),
      floatingActionButton: BaseFloatingActionButton(
      onTap: () {Get.to(const BookIssueView());},
      title: 'Book Issue\nRequest',
    ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                              const Spacer(),
                              const Icon(
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
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 0.0,),
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
                              const Spacer(),
                              const Icon(
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
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 0.0,),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: translate(context).search_by_id,
                    borderColor: Colors.transparent,
                    hintTextColor: CustomColors.textLightGreyColor,
                    contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                physics: const NeverScrollableScrollPhysics(),
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
    return BaseTabBar(
      controller: controller.libraryRecordsController,
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
    );
  }
}
