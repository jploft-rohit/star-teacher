import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/leave_request_screen/upload_evidence_popup.dart';
import 'package:staff_app/view/request_online_classes/controller/online_class_request_controller.dart';
import 'package:staff_app/view/request_online_classes/online_class_request_tile.dart';
import 'package:staff_app/view/request_online_classes/create_online_class_request.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

import 'package:staff_app/utility/base_views/base_floating_action_button.dart';

class RequestOnlineClassesDetail extends StatefulWidget {
  RequestOnlineClassesDetail({Key? key}) : super(key: key);

  @override
  State<RequestOnlineClassesDetail> createState() => _RequestOnlineClassesDetailState();
}

class _RequestOnlineClassesDetailState extends State<RequestOnlineClassesDetail> {
  OnlineClassRequestController controller = Get.put(OnlineClassRequestController());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.screenBackgroundColor,
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const CreateOnlineClassRequest());},
        title: translate(context).add_request,
      ),
      appBar: BaseAppBar(title: translate(context).online_class_request),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseTextFormField(
              controller: controller.schoolController,
              errorText: "Please Select School",
              isDropDown: true,
              hintText: controller.schoolController.text.isEmpty ? "Select School" : controller.schoolController.text,
              items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                return DropdownMenuItem(
                  value: data,
                  child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                );
              }).toList(),
              onChanged: (value) async {
                controller.schoolController.text = value?.name??"";
                controller.selectedSchoolId.value = value?.sId??"";
                controller.getData();
              },
            ),
            Expanded(child: OnlineClassRequestTile())
          ],
        ),
      ),
    );
  }
}
