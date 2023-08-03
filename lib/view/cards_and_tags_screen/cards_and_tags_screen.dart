import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_switch.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/cards_and_tags_screen/controller/card_tag_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/shop_screen/shop_screen.dart';

class CardsAndTagsScreen extends StatefulWidget {
  const CardsAndTagsScreen({Key? key}) : super(key: key);

  @override
  State<CardsAndTagsScreen> createState() => _CardsAndTagsScreenState();
}

class _CardsAndTagsScreenState extends State<CardsAndTagsScreen> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  CardTagCtrl controller = Get.put(CardTagCtrl());
  MyProfileCtrl profileController = Get.find<MyProfileCtrl>();
  bool isCardEnable = true;
  bool isTagEnable = false;
  final List<String> pendingMeetingdates = ['July 2, 8:30PM', '', '', ''];

  final List<String> heading = [
    'Request\nRaised',
    'Request\nAccepted',
    'Card\nIssued',
    'Received'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).card_tags),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Obx(()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: BaseColors.borderColor
                    )
                  ),
                  child: ListTile(
                    visualDensity: const VisualDensity(horizontal: -4),
                    contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp, bottom: 10.sp),
                    leading: Container(
                      height: double.infinity,
                      width: 17.w,
                      padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: BaseColors.primaryColor
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: BaseImageNetwork(
                        link: profileController.response.value.data?.profilePic??"",
                        errorWidget: SvgPicture.asset(manSvg),
                      ),//co
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoItems(translate(context).name, profileController.response.value.data?.name??""),
                        const SizedBox(
                          height: 2.0,
                        ),
                        buildInfoItems(translate(context).id, "#${profileController.response.value.data?.emirateId??""}"),
                        const SizedBox(
                          height: 2.0,
                        ),
                        buildInfoItems(translate(context).designation, profileController.response.value.data?.designation??"Teacher"),
                        const SizedBox(
                          height: 2.0,
                        ),
                        buildInfoItems(translate(context).subject, "Maths"),
                        const SizedBox(
                          height: 2.0,
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: (){
                        showScanQrDialogue(context, false,data: profileController.response.value.data?.barcode??"");
                      },
                      child: QrImage(
                        data: profileController.response.value.data?.barcode??"",
                        version: QrVersions.auto,
                        size: 70,
                        gapless: false,
                      ),
                    ),
                  ),
                ),
                BaseSchoolDropDown(
                  controller: controller.selectedSchoolController,
                  onChanged: (val){
                    controller.selectedSchoolController.text = val.name;
                    controller.selectedSchoolId.value = val.sId;
                    controller.getData();
                  },
                  bottomMargin: 2.h,
                  topMargin: 2.h,
                ),
                Text("${translate(context).select_options} : ", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
                SizedBox(
                  height: 1.h,
                ),
                BaseButton(title: translate(context).request_cards_tags, onPressed: (){
                  Get.to(ShopView(initialTabIndex: 1,));
                },btnType: "iconButton"),
                SizedBox(height: 1.h,),
                BaseButton(title: translate(context).synchronize_nfc_to_cards_tags, onPressed: (){
                  showNFCDialog(context,"");
                },btnType: "iconButton"),
                SizedBox(height: 2.h),
                Text("${translate(context).linked_card_tag} :", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
                SizedBox(height: 1.h),
                (controller.userTagsList?.length??0) == 0
                    ? BaseNoData(message: "No Linked Card & Tag Found!",topMargin: 1.5.h, bottomMargin: 1.5.h,)
                    : ListView.builder(
                      itemCount: controller.userTagsList?.length??0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                      return buildCardTile(
                      translate(context).card_No,
                      controller.userTagsList?[index]?.tagNo.toString()??"",
                      (controller.userTagsList?[index]?.status.toString()??"") == "active" ? true : false,
                      (bool value) {
                        controller.updateCardTagStatus(status: value, id: controller.userTagsList?[index]?.sId, index: index);
                     },
                    );
                  },
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("${translate(context).requests} : ", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
                SizedBox(
                  height: 1.h,
                ),
                (controller.ordersList?.length??0) == 0
                    ? BaseNoData(message: "No Request Found!",topMargin: 1.5.h, bottomMargin: 1.5.h,)
                    : ListView.builder(
                       itemCount: controller.ordersList?.length??0,
                       shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                       itemBuilder: (context, index) {
                       int stepperIndex = -5;
                       controller.statusTime.value = [];
                       controller.statusTitle.value = [];
                       controller.ordersList?[index]?.requestStatus?.asMap().forEach((loopIndex,element) {
                       controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
                       controller.statusTime.add(getFormattedTimeWithMonth(element.date??""));
                       if ((element.date?.toString()??"").isNotEmpty) {
                         stepperIndex = loopIndex;
                       }
                    });
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                                color: BaseColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/Layer_1.svg", height: 2.h),
                                SizedBox(
                                  width: 2.w,
                                ),
                                buildInfoItems(translate(context).deactivation_card_no, controller.ordersList?[index]?.userTags?.tagNo.toString()??""),
                              ],
                            ),
                            Divider(
                              color: BaseColors.borderColor,
                              thickness: 1.0,
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/report.svg",height: 2.1.h),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("${translate(context).reason} : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                                Flexible(child: Text((controller.ordersList?[index]?.reason??"N/A"), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                            Divider(
                              color: BaseColors.borderColor,
                              thickness: 1.0,
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset("assets/images/Vector (1).svg",height: 2.h),
                                      SizedBox(width: 2.w),
                                      Text(formatBackendDate(controller.ordersList?[index]?.createdAt??"", getDayFirst: false), style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 3.h,
                                  width: 1.0,
                                  color: BaseColors.borderColor,
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset("assets/images/time_icon.svg",height: 2.h),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(getFormattedTime(controller.ordersList?[index]?.createdAt??""), style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                             Divider(
                              color: BaseColors.borderColor,
                              thickness: 1.0,
                              height: 3.h,
                            ),
                            StepProgressView(
                              width: MediaQuery.of(context).size.width,
                              curStep: stepperIndex+1,
                              color: BaseColors.primaryColor,
                              titles: controller.statusTime,
                              statuses: controller.statusTitle,
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
      ),
    );
  }

  Widget buildTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: BaseColors.primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
          Icon(
            Icons.arrow_forward,
            color: BaseColors.primaryColor,
            size: 20.sp,
          )
        ],
      ),
    );
  }
  Widget buildCardTile(String title, String heading, isEnable ,Function(bool) onChanged){
     return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: BaseColors.white,
          boxShadow: [
            getBoxShadow()
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset("assets/images/Layer_1.svg",height: 2.h),
          SizedBox(
            width: 1.w,
          ),
          buildInfoItems(title, heading),
          const Spacer(),
          Row(
            children: [
              Text(isRTL ? "On" : "Off", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),),
              SizedBox(
                width: 1.w,
              ),
              BaseSwitch(
                key: GlobalKey(),
                value: isEnable,
                enableColor: BaseColors.backgroundColor,
                enableSwitchColor: BaseColors.primaryColor,
                disableColor: BaseColors.textLightGreyColor,
                width: 35,
                height: 20,
                switchHeight: 20,
                switchWidth: 15,
                onChanged: onChanged,
              ),
              SizedBox(
                width: 1.w,
              ),
              Text(isRTL ? "Off" : "On", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),),
            ],
          )
        ],
      ),
    );
  }
}
