import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/early_leave_and_permission/controller/early_leave_controller.dart';
import 'package:staff_app/view/early_leave_and_permission/create_early_leave.dart';
import 'package:staff_app/view/early_leave_and_permission/early_leave_tiles.dart';
import 'package:staff_app/view/schedule_meeting_screen/create_meeting_screen.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import '../../language_classes/language_constants.dart';

class EarlyLeavePermission extends StatefulWidget {
  const EarlyLeavePermission({Key? key}) : super(key: key);

  @override
  State<EarlyLeavePermission> createState() => _EarlyLeavePermissionState();
}

class _EarlyLeavePermissionState extends State<EarlyLeavePermission> {
  EarlyLeaveController ctrl = Get.put(EarlyLeaveController());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).schedule_meeting),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const CreateEarlyLeave());},
        title: 'Request',
      ),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: Column(
          children: [
            BaseTextFormField(
              controller: ctrl.schoolController,
              errorText: "Please Select School",
              isDropDown: true,
              hintText: ctrl.schoolController.text.isEmpty ? "Select School" : ctrl.schoolController.text,
              items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                return DropdownMenuItem(
                  value: data,
                  child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                );
              }).toList(),
              onChanged: (value) async {
                ctrl.schoolController.text = value?.name??"";
                ctrl.selectedSchoolId.value = value?.sId??"";
                ctrl.getData();
              },
            ),
            Expanded(child: EarlyLeaveTile()),
          ],
        ),
      ),
    );
  }
}