import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';

class LostTab extends StatefulWidget {
  const LostTab({Key? key}) : super(key: key);

  @override
  State<LostTab> createState() => _LostTabState();
}

class _LostTabState extends State<LostTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Get.to(ReportLostFoundScreen(isUpdating: true, type: 'Lost',));
          },
          child: Card(
            elevation: 3.0,
            margin: const EdgeInsets.only(bottom: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      addText("Title: ", 16.sp, BaseColors.textBlackColor,
                          FontWeight.w700),
                      addText("Lost a book in the computer lab.", 16.sp,
                          BaseColors.primaryColor, FontWeight.w700),
                    ],
                  ),
                  const Divider(),
                  buildInfoItems("Lost Date", "28-11-2022"),
                  const Divider(),
                  buildInfoItems("Where", "In Computer Lab"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Image.asset("assets/delete/Rectangle 360.png"),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  // Center(
                  //   child: BaseButton(
                  //     title: "Request for Return",
                  //     onPressed: (){
                  //       showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
                  //         return ConfirmationDialog(msg: "Return request is successfully sent", isShowBtn: true,btnText: "OK",);
                  //       });
                  //     },
                  //     textSize: 15.sp,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
