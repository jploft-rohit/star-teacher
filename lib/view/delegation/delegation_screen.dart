import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assignment_staff_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';
import 'package:staff_app/view/assignments_screen/submitted_assignment_view.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';

class DelegationScreen extends StatefulWidget {
  const DelegationScreen({Key? key}) : super(key: key);

  @override
  State<DelegationScreen> createState() => _DelegationScreenState();
}

class _DelegationScreenState extends State<DelegationScreen> {
  AssignmentScreenCtrl controller = Get.put(AssignmentScreenCtrl());
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).roles_delegation),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            BaseDropDown(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context,index){
                  return index.isEven
                      ? delegationRequest()
                      : interviewRequest();
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget delegationRequest (){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText("Roles Delegation Request", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/profile.svg",height: 2.1.h),
                SizedBox(width: 2.w),
                Flexible(child: buildInfoItems(translate(context).requested_to, "Ibram Khan"))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg",height: 15.sp,),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).from, "01/03/2022")),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).to, "07/03/2022")),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/report.svg"),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(child: buildInfoItems(translate(context).delegated_functions, "Stars Attendance, Notebook"))
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/report.svg"),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(child: buildInfoItems(translate(context).message, "I have a upcoming surgery"))
              ],
            ),
            const Divider(),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: BaseButton(title: translate(context).reject.toUpperCase(),btnType: mediumLargeButton,
                      isActive: false,
                      onPressed: (){
                        showGeneralDialog(
                            context: context,
                            pageBuilder: (ctx,a,b){
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.close_rounded,color: Colors.transparent),
                                          Text(translate(context).reject_reason,
                                              style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: Colors.black)),
                                          GestureDetector(onTap: (){
                                            Navigator.pop(context);
                                          },child: const Icon(Icons.close_rounded))
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextField(controller: reasonController, hintText: translate(context).type_here,maxLine: 5,),
                                      const SizedBox(height: 16),
                                      BaseButton(btnType: mediumButton,
                                          borderRadius: 20,
                                          title: translate(context).submit_btn_txt, onPressed: (){Navigator.pop(context);}),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){},btnType: mediumLargeButton,),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget interviewRequest (){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addText("Star Interview Request", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SvgPicture.asset("assets/images/Vector (1).svg"),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(child: buildInfoItems("Request ID", "4234234")),
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/profile.svg",height: 2.1.h),
                SizedBox(width: 2.w),
                Flexible(child: buildInfoItems("Star Name", "Mohammad kaif"))
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/profile.svg",height: 2.1.h),
                SizedBox(width: 2.w),
                Flexible(child: buildInfoItems("Interview Person", "Shahraban Abdullah"))
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg",height: 2.0.h),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems("Interview Date", "01/07/2023")),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/time_icon.svg",height: 2.0.h),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems("Time", "10:30 AM")),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SvgPicture.asset("assets/images/Vector (1).svg",height: 2.0.h),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(child: buildInfoItems("Meeting URL", "Stars Video Call",svgPath: "assets/images/video.svg")),
              ],
            ),
            const Divider(),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: BaseButton(title: translate(context).reject.toUpperCase(),btnType: mediumLargeButton,
                      isActive: false,
                      onPressed: (){
                        showGeneralDialog(
                            context: context,
                            pageBuilder: (ctx,a,b){
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.close_rounded,color: Colors.transparent),
                                          Text(translate(context).reject_reason,
                                              style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: Colors.black)),
                                          GestureDetector(onTap: (){
                                            Navigator.pop(context);
                                          },child: const Icon(Icons.close_rounded))
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextField(controller: reasonController, hintText: translate(context).type_here,maxLine: 5,),
                                      const SizedBox(height: 16),
                                      BaseButton(btnType: mediumButton,
                                          borderRadius: 20,
                                          title: translate(context).submit_btn_txt, onPressed: (){Navigator.pop(context);}),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){},btnType: mediumLargeButton,),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

}
