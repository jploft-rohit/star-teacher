import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/lost_or_found_screen/report_lost_found_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class LostAndFoundScreen extends StatefulWidget {
  const LostAndFoundScreen({Key? key}) : super(key: key);

  @override
  State<LostAndFoundScreen> createState() => _LostAndFoundScreenState();
}

class _LostAndFoundScreenState extends State<LostAndFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Lost & Found"),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const ReportLostFoundScreen());},
        title: 'Report Lost\nItem',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: BaseColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(const ReportLostFoundScreen(isUpdating: true,));
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
                            buildInfoItems("Found Date", "28-June-2022"),
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
                              child: Image.asset("assets/images/Rectangle 360.png"),
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
                                textSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
