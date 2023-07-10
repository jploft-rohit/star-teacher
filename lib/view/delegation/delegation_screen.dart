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
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assignment_staff_view.dart';
import 'package:staff_app/view/assignments_screen/controller/assignment_screen_ctrl.dart';
import 'package:staff_app/view/assignments_screen/submitted_assignment_view.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment.dart';
import 'package:staff_app/view/delegation/controller/roles_delegation_controller.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';

class DelegationScreen extends StatefulWidget {
  const DelegationScreen({Key? key}) : super(key: key);

  @override
  State<DelegationScreen> createState() => _DelegationScreenState();
}

class _DelegationScreenState extends State<DelegationScreen> {
  RolesDelegationController controller = Get.put(RolesDelegationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).roles_delegation),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Obx(()=>Column(
            children: [
              BaseSchoolDropDown(
                controller: controller.schoolController,
                onChanged: (value){
                  controller.schoolController.text = value.name??"";
                  controller.selectedSchoolId.value = value.sId??"";
                  controller.getData();
                },
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.list?.length??0,
                  itemBuilder: (context,index){
                    return delegationRequest(index: index);
                },
               ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget delegationRequest ({required int index}){
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
                Flexible(child: buildInfoItems(translate(context).requested_to, controller.list?[index]?.assistingWhom?.name??""))
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
                    Flexible(child: buildInfoItems(translate(context).from, formatBackendDate(controller.list?[index]?.fromDate??""))),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).to, formatBackendDate(controller.list?[index]?.toDate??""))),
                  ],
                ),
              ],
            ),
            // const Divider(),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SvgPicture.asset("assets/images/report.svg"),
            //     SizedBox(
            //       width: 2.w,
            //     ),
            //     Flexible(child: buildInfoItems(translate(context).delegated_functions, "Stars Attendance, Notebook"))
            //   ],
            // ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/report.svg"),
                SizedBox(width: 2.w),
                Flexible(child: buildInfoItems(translate(context).message, controller.list?[index]?.instructions??""))
              ],
            ),
            const Divider(),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  Expanded(
                    child: BaseButton(title: translate(context).reject.toUpperCase(),btnType: mediumLargeButton,
                      isActive: false,
                      onPressed: (){
                        // showGeneralDialog(
                        //     context: context,
                        //     pageBuilder: (ctx,a,b){
                        //       return Dialog(
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(18),
                        //           child: Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             crossAxisAlignment: CrossAxisAlignment.center,
                        //             children: [
                        //               Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   const Icon(Icons.close_rounded,color: Colors.transparent),
                        //                   Text(translate(context).reject_reason,
                        //                       style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: Colors.black)),
                        //                   GestureDetector(onTap: (){
                        //                     Navigator.pop(context);
                        //                   },child: const Icon(Icons.close_rounded))
                        //                 ],
                        //               ),
                        //               const SizedBox(height: 10),
                        //               CustomTextField(controller: reasonController, hintText: translate(context).type_here,maxLine: 5,),
                        //               const SizedBox(height: 16),
                        //               BaseButton(btnType: mediumButton,
                        //                   borderRadius: 20,
                        //                   title: translate(context).submit_btn_txt, onPressed: (){Navigator.pop(context);}),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     });
                        BaseOverlays().showReasonDeleteDialog(
                          title: "Reject Reason",
                          controller: controller.reasonController,
                          formKey: controller.formKey,
                          onProceed: (){
                            if (controller.formKey.currentState?.validate()??false) {
                              BaseOverlays().dismissOverlay();
                              controller.updateStatus(id: controller.list?[index]?.sId??"", status: "rejected");
                            }
                          }
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){
                      controller.updateStatus(id: controller.list?[index]?.sId??"", status: 'accepted');
                    },btnType: mediumLargeButton),
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

  // Widget interviewRequest (){
  //   return Card(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0)
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.all(15.sp),
  //       child: Column(
  //         children: [
  //           const Divider(),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               addText("Star Interview Request", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
  //             ],
  //           ),
  //           const Divider(),
  //           Row(
  //             children: [
  //               SvgPicture.asset("assets/images/Vector (1).svg"),
  //               SizedBox(
  //                 width: 2.w,
  //               ),
  //               Flexible(child: buildInfoItems("Request ID", "4234234")),
  //             ],
  //           ),
  //           const Divider(),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               SvgPicture.asset("assets/images/profile.svg",height: 2.1.h),
  //               SizedBox(width: 2.w),
  //               Flexible(child: buildInfoItems("Star Name", "Mohammad kaif"))
  //             ],
  //           ),
  //           const Divider(),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               SvgPicture.asset("assets/images/profile.svg",height: 2.1.h),
  //               SizedBox(width: 2.w),
  //               Flexible(child: buildInfoItems("Interview Person", "Shahraban Abdullah"))
  //             ],
  //           ),
  //           const Divider(),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   SvgPicture.asset("assets/images/Vector (1).svg",height: 2.0.h),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(child: buildInfoItems("Interview Date", "01/07/2023")),
  //                 ],
  //               ),
  //               Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   SvgPicture.asset("assets/images/time_icon.svg",height: 2.0.h),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(child: buildInfoItems("Time", "10:30 AM")),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           const Divider(),
  //           Row(
  //             children: [
  //               SvgPicture.asset("assets/images/Vector (1).svg",height: 2.0.h),
  //               SizedBox(
  //                 width: 2.w,
  //               ),
  //               Flexible(child: buildInfoItems("Meeting URL", "Stars Video Call",svgPath: "assets/images/video.svg")),
  //             ],
  //           ),
  //           const Divider(),
  //           SizedBox(
  //             height: 3.h,
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 15.w),
  //             child: Row(
  //               children: [
  //                 Expanded(
  //                   child: BaseButton(title: translate(context).reject.toUpperCase(),btnType: mediumLargeButton,
  //                     isActive: false,
  //                     onPressed: (){
  //                       showGeneralDialog(
  //                           context: context,
  //                           pageBuilder: (ctx,a,b){
  //                             return Dialog(
  //                               child: Padding(
  //                                 padding: const EdgeInsets.all(18),
  //                                 child: Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   crossAxisAlignment: CrossAxisAlignment.center,
  //                                   children: [
  //                                     Row(
  //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         const Icon(Icons.close_rounded,color: Colors.transparent),
  //                                         Text(translate(context).reject_reason,
  //                                             style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: Colors.black)),
  //                                         GestureDetector(onTap: (){
  //                                           Navigator.pop(context);
  //                                         },child: const Icon(Icons.close_rounded))
  //                                       ],
  //                                     ),
  //                                     const SizedBox(height: 10),
  //                                     CustomTextField(controller: controller.reasonController, hintText: translate(context).type_here,maxLine: 5,),
  //                                     const SizedBox(height: 16),
  //                                     BaseButton(btnType: mediumButton,
  //                                         borderRadius: 20,
  //                                         title: translate(context).submit_btn_txt, onPressed: (){Navigator.pop(context);}),
  //                                   ],
  //                                 ),
  //                               ),
  //                             );
  //                           });
  //                     },
  //                   ),
  //                 ),
  //                 SizedBox(width: 4.w),
  //                 Expanded(
  //                   child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){},btnType: mediumLargeButton,),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: 2.h,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
