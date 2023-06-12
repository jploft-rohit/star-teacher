import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/responses_model/leave_type_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/leave_request_screen/add_leave_request_view.dart';
import 'package:staff_app/view/leave_request_screen/controller/leave_request_ctrl.dart';
import 'package:staff_app/view/leave_request_screen/leave_balance_popup.dart';
import 'package:staff_app/view/leave_request_screen/leave_request_list_tile.dart';
import 'package:staff_app/view/leave_request_screen/upload_evidence_popup.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({Key? key}) : super(key: key);

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController leaveTypeController = TextEditingController();
  LeaveRequestCtrl controller = Get.put(LeaveRequestCtrl());
  BaseCtrl baseCtrl = Get.put(BaseCtrl());
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', 'July 3,\n10:30AM', 'July 3,\n10:30AM'];
  String? initialLeaveType;
  var leaveTypeDropdownData = [
    // 'Leave Type'
    'Annual leave',
    'Compassionate leave',
    'Sick leave',
    'Local escort leave',
    'Abroad escort leave',
    'National service leave',
    'Event leave',
    'Hajj leave',
    'Paternity Leave',
    'Maternity Leave',
    'Leave without pay',
  ];
  final List<String> heading = [
    'Request\nRaised',
    'Request\nAccepted',
    'Evidence\nSubmit',
    'Evidence\nApproved'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).leave_request),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const AddLeaveRequestView());},
        title: translate(context).leave_request,
      ),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: Column(
          children: [
            BaseTextFormField(
              controller: controller.selectSchoolController.value,
              errorText: "Please select school",
              isDropDown: true,
              hintText: controller.selectSchoolController.value.text.isEmpty ? "Select School" : controller.selectSchoolController.value.text,
              items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                return DropdownMenuItem<SchoolData>(
                  value: data,
                  child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                );
              }).toList(),
              onChanged: (value) async {
                controller.selectSchoolController.value.text = value?.name??"";
                controller.selectedSchoolId.value = value?.sId??"";
                controller.get();
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 8.h,
                    child: BaseTextFormField(
                      rightMargin: 1.w,
                      controller: controller.leaveTypeController.value,
                      hintText: controller.leaveTypeController.value.text.isEmpty ? translate(context).leave_type : controller.leaveTypeController.value.text,
                      isDropDown: true,
                      items: controller.leaveTypeList?.map((LeaveTypeData data) {
                        return DropdownMenuItem<LeaveTypeData>(
                            value: data,
                            child: addText(data.name??"", 16.sp, Colors.black, FontWeight.w400));
                      }).toList(),
                      onChanged: (value){
                        controller.leaveTypeController.value.text = value.name??"";
                        controller.selectedLeaveTypeId.value = value.sId??"";
                        controller.get();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return const LeaveBalancePopup();
                        },
                      );
                    },
                    child: Container(
                      width: 50.w,
                      height: 6.h,
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      margin: EdgeInsets.only(left: 1.w),
                      decoration: BoxDecoration(
                        color: BaseColors.backgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: BaseColors.primaryColor
                        ),
                      ),
                      child: Center(child: Text(translate(context).check_leave_balance, style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            LeaveRequestListTile(),
          ],
        ),
      ),
    );
  }
}
