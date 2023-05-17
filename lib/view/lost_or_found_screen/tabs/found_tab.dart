import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/lost_or_found_screen/report_lost_found_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class FoundTab extends StatefulWidget {
  const FoundTab({Key? key}) : super(key: key);

  @override
  State<FoundTab> createState() => _FoundTabState();
}

class _FoundTabState extends State<FoundTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
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
                      addText("Found a book in the computer lab.", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                    ],
                  ),
                  const Divider(),
                  buildInfoItems(translate(context).found_date, "28-11-2022"),
                  const Divider(),
                  buildInfoItems("Where", "In Computer Lab"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Image.asset("assets/delete/Rectangle 360.png"),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Center(
                    child: BaseButton(
                      title: "Request for Return",
                      onPressed: (){
                        showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
                          return ConfirmationDialog(msg: "Return request is successfully sent", isShowBtn: true,btnText: "OK",);
                        });
                      },
                      btnType: toggleLargeButton,
                      borderRadius: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
