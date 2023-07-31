import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/lost_or_found_screen/controller/lost_found_controller.dart';
import 'package:staff_app/view/lost_or_found_screen/report_lost_found_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class LostFoundTab extends StatefulWidget {
  const LostFoundTab({Key? key}) : super(key: key);

  @override
  State<LostFoundTab> createState() => _LostFoundTabState();
}

class _LostFoundTabState extends State<LostFoundTab> {
  LostFoundController controller = Get.find<LostFoundController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
        shrinkWrap: true,
        itemCount: controller.list?.length??0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              // Get.to(ReportLostFoundScreen(isUpdating: true, type: 'Found',));
            },
            child: Card(
              elevation: 3.0,
              margin: const EdgeInsets.only(bottom: 15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        addText("Title: ", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                        addText(controller.list?[index].title??"", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                      ],
                    ),
                    const Divider(),
                    BaseDetailData(detailsLabel:controller.selectedTabIndex.value == 0 ? translate(context).found_date : "Lost Date", detailsValue:formatBackendDate(controller.list?[index].date??"")),
                    BaseDetailData(detailsLabel:"Where", detailsValue:controller.list?[index].location??""),
                    Container(
                      alignment: Alignment.center,
                      child: BaseImageNetwork(
                        link: (controller.list?[index].document??""),
                        height: 30.h,
                        borderRadius: 10,
                        errorWidget: Image.asset("assets/delete/Rectangle 360.png"),
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Visibility(
                      visible: controller.selectedTabIndex.value == 0,
                      child: Center(
                        child: BaseButton(
                          title: "Request for Return",
                          onPressed: (){
                            BaseOverlays().showConfirmationDialog(onRightButtonPressed: (){
                              controller.requestReturn(id: controller.list?[index].sId??"");
                            },title: "Are you sure, you want to return this ?");
                          },
                          btnType: toggleLargeButton,
                          borderRadius: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
