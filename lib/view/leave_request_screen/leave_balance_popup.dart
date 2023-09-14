import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_loader.dart';
import 'package:staff_app/view/leave_request_screen/controller/leave_request_ctrl.dart';

class LeaveBalancePopup extends StatefulWidget {
  const LeaveBalancePopup({Key? key}) : super(key: key);

  @override
  State<LeaveBalancePopup> createState() => _LeaveBalancePopupState();
}

class _LeaveBalancePopupState extends State<LeaveBalancePopup> {
  LeaveRequestCtrl controller = Get.find<LeaveRequestCtrl>();

  @override
  void initState() {
    super.initState();
    controller.getLeaveBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    Text(translate(context).leave_balance, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  color: Colors.white,
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(1.5),
                      2: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                          children: [
                            Text(translate(context).leave_type,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            Text(translate(context).allocated,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            Text(translate(context).balance,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                          ]),

                    ],
                  ),
                ),
                const Divider(),
                Obx(()=> controller.isLeaveBalanceLoading.value
                      ? const BaseLoader()
                      : ListView.builder(
                        itemCount: controller.leaveBalanceList?.length??0,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                        return Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Table(
                              border: TableBorder.all(color: Colors.transparent),
                              columnWidths: const {
                                0: FlexColumnWidth(3),
                                1: FlexColumnWidth(1.5),
                                2: FlexColumnWidth(1),
                              },
                              children: [
                                TableRow(
                                    children: [
                                      Row(
                                        children: [
                                          Text(controller.leaveBalanceList?[index].leaveType?.name??"", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                          SizedBox(width: 2.w),
                                          JustTheTooltip(
                                            triggerMode: TooltipTriggerMode.tap,
                                            tailBaseWidth: 10,
                                            tailLength: 7,
                                            content: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                              child: Text(controller.leaveBalanceList?[index].leaveType?.description??"N/A",
                                              ),
                                            ),
                                            child: Material(
                                              color: Colors.white,
                                              shape: const CircleBorder(),
                                              elevation: 4.0,
                                              child: SvgPicture.asset("assets/images/information-button(1) 1.svg"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(controller.leaveBalanceList?[index].allocated?.toString()??"N/A", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                      Text(controller.leaveBalanceList?[index].remaining?.toString()??"N/A", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                    ]),
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
