import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/library_record/library_record_controller.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class ReturnView extends StatefulWidget {
  const ReturnView({super.key});

  @override
  State<ReturnView> createState() => _ReturnViewState();
}

class _ReturnViewState extends State<ReturnView> {
  LibraryRecordsController controller = Get.find<LibraryRecordsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
              width: 100.w,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              decoration: BoxDecoration(
                color: BaseColors.white,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: BaseColors.textLightGreyColor),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 3)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildDetailRow("assets/images/user 1.svg", 'Star: ', 'Najma Suheil'),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/Vector (1).svg"),
                          SizedBox(width: 1.h),
                          addText('01/03/2022', 14.sp,
                              BaseColors.textBlackColor, FontWeight.w400)
                        ],
                      ),
                      SizedBox(width: 5.h),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/time_icon.svg"),
                          SizedBox(width: 1.h),
                          addText('01/03/2022', 14.sp,
                              BaseColors.textBlackColor, FontWeight.w400)
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  buildDetailRow("assets/images/report.svg", 'Book Type : ',
                      'General Knowledge'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(width: 1.h),
                      buildInfoItems("Books", "Global GK, World GK by AR Rehman"),
                      SizedBox(width: 0.5.h),
                      GestureDetector(
                        onTap: (){
                          showGeneralDialog(
                            context: context,
                            pageBuilder:  (context, animation, secondaryAnimation) {
                              return OpenPdfPopup(title: "");
                            },
                          );
                        },
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: BaseColors.primaryColor,
                          size: 19.sp,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(width: 1.h),
                      Flexible(
                        child: buildInfoItems('Message',
                            'Need this books to gain extra information for inter school competition '),
                      ),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: 5,
                      color: BaseColors.primaryColor,
                      titles: controller.returndates,
                      statuses: controller.reuestedheading,
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
            SizedBox(height: 6.h)
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(icon, title, body) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 1.h),
            addText(title, 13.sp, BaseColors.textBlackColor,
                FontWeight.w400),
            addText(body, 14.sp, BaseColors.primaryColor,
                FontWeight.w700),
          ],
        ),
        Divider()
      ],
    );
  }
}
