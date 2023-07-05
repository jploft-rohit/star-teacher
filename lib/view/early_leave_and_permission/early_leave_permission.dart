import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/early_leave_and_permission/controller/early_leave_controller.dart';
import 'package:staff_app/view/early_leave_and_permission/create_early_leave.dart';
import 'package:staff_app/view/early_leave_and_permission/early_leave_tiles.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

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
      appBar: BaseAppBar(title: "Early Leave & Permission"),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const CreateEarlyLeave());},
        title: 'Request',
      ),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: Column(
          children: [
            BaseSchoolDropDown(
              controller: ctrl.schoolController,
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