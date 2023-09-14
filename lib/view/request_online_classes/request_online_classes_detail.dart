import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/view/request_online_classes/controller/online_class_request_controller.dart';
import 'package:staff_app/view/request_online_classes/online_class_request_tile.dart';
import 'package:staff_app/view/request_online_classes/create_online_class_request.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class RequestOnlineClassesDetail extends StatefulWidget {
  const RequestOnlineClassesDetail({Key? key}) : super(key: key);

  @override
  State<RequestOnlineClassesDetail> createState() => _RequestOnlineClassesDetailState();
}

class _RequestOnlineClassesDetailState extends State<RequestOnlineClassesDetail> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
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
        padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseSchoolDropDown(
              controller: controller.schoolController,
              onChanged: (value) async {
                controller.schoolController.text = value?.name??"";
                controller.selectedSchoolId.value = value?.sId??"";
                controller.getData();
              },
            ),
            const Expanded(child: OnlineClassRequestTile())
          ],
        ),
      ),
    );
  }
}
