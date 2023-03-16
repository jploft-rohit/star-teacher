import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
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
      appBar: appBarWithAction(context, "Lost & Found", [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              Get.to(const ReportLostFoundScreen());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
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
          Text("Report Lost\nItem", style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),textAlign: TextAlign.center,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
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
                  return Card(
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
                              addText("Title: ", 15.sp, CustomColors.textBlackColor, FontWeight.w700),
                              addText("Found a book in the computer lab.", 15.sp, CustomColors.primaryColor, FontWeight.w700),
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
                            child: CustomButton(
                              text: "Request for Return",
                              onPressed: (){
                                showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
                                  return ConfirmationDialog(msg: "Return request is successfully sent", isShowBtn: true,btnText: "OK",);
                                });
                              },
                              borderRadius: 50.0,
                              btnHeight: 30.0,
                              btnWidth: 40.w,
                              textSize: 15.sp,
                            ),
                          ),
                        ],
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
