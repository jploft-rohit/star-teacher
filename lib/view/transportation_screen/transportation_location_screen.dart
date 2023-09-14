import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/utility/intl/intl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/transportation_screen/change_address_screen.dart';
import 'package:staff_app/view/transportation_screen/controller/transportation_screen_ctrl.dart';

class TransportationLocationScreen extends StatefulWidget {
  const TransportationLocationScreen({Key? key}) : super(key: key);

  @override
  State<TransportationLocationScreen> createState() => _TransportationLocationScreenState();
}

class _TransportationLocationScreenState extends State<TransportationLocationScreen> {
  TransportationScreenCtrl controller = Get.find<TransportationScreenCtrl>();
  List<String> listTitle = [
    "Request\nRaised",
    "Reviewed",
    "Approve"
  ];
  List<String> listDate = [
    "July 2, 8:30PM",
    "July 3, 10:30AM",
    ""
  ];

  @override
  void initState() {
    super.initState();
    controller.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(()=>Visibility(
          visible: (controller.locationData?.value?.changeLocationRequestData ==  null),
          child: BaseFloatingActionButton(
            onTap: (){
              Get.to(const ChangeAddressScreen());
            },
            title: 'Create',
          ),
        ),
      ),
      appBar: BaseAppBar(title: translate(context).location),
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
                  child: Obx(()=>ListTile(
                    visualDensity: const VisualDensity(horizontal: -4),
                    contentPadding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp, bottom: 15.sp),
                    leading: GestureDetector(
                      onTap: (){
                        BaseOverlays().viewPhoto(url: controller.tripData.value?.passangerUser?.profilePic??"");
                      },
                      child: Container(
                        height: 20.w,
                        width: 17.w,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: BaseImageNetwork(
                          link: controller.tripData.value?.passangerUser?.profilePic??"",
                          concatBaseUrl: false,
                          borderRadius: 13,
                          fit: BoxFit.fitWidth,
                          errorWidget: SvgPicture.asset(manSvg),
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(toBeginningOfSentenceCase(controller.tripData.value?.passangerUser?.name??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                        const SizedBox(height: 2.0),
                        Text("#${controller.tripData.value?.passangerUser?.emirateId??"N/A"}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                        const SizedBox(height: 2.0),
                        Text(toBeginningOfSentenceCase(controller.tripData.value?.passangerUser?.role?.name??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      ],
                    ),
                    trailing: GestureDetector(onTap: (){
                      showScanQrDialogue(context, false);
                    },child: BaseQr(data: controller.tripData.value?.passangerUser?.barcode??"")),
                  ),
                  ),
                ),
                ((controller.locationData?.value?.changeLocationRequestData?.sector??"").isEmpty??true)
                    ? BaseNoData(message: "No Location Data Found,",topMargin: 35.h)
                    : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 2.h),
                    // Row(
                    //   children: [
                    //     Flexible(flex: 1,child: BaseButton(title: translate(context).print_QR,  textSize: 15.sp,onPressed: (){
                    //       Get.to(PrintQrScreen());
                    //     },),),
                    //     SizedBox(
                    //       width: 2.w,
                    //     ),
                    //     Flexible(flex: 1,child: BaseButton(title: translate(context).programme_NFC, textSize: 15.sp, onPressed: (){
                    //       showNFCDialog(context,"");
                    //     })),
                    //   ],
                    // ),
                    // SizedBox(height: 2.h,),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: BaseColors.primaryColor,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(child: buildInfoItems(translate(context).location, controller.locationData?.value?.changeLocationRequestData?.location??""))
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 25.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: BaseColors.primaryColor
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: BaseImageNetwork(
                        link: controller.locationData?.value?.changeLocationRequestData?.flatPhoto??"",
                        width: double.infinity,
                        concatBaseUrl: false,
                        // errorWidget: SvgPicture.asset(homeSvg, fit: BoxFit.scaleDown),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildInfoItems(translate(context).sector, controller.locationData?.value?.changeLocationRequestData?.sector??""),
                            SizedBox(height: .5.h),
                            buildInfoItems(translate(context).area, controller.locationData?.value?.changeLocationRequestData?.area??""),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return ConfirmationDialog(
                                      msg: translate(context).are_you_sure_you_want_to_change_the_location,
                                      isShowBtn: true,
                                      onTap: (){
                                        BaseOverlays().dismissOverlay();
                                        Get.to(ChangeAddressScreen(isUpdating: true, data: controller.locationData?.value?.changeLocationRequestData));
                                      },
                                    );
                                  },
                                );
                              },
                              child: Image.asset(editPng, height: 18.sp, color: BaseColors.primaryColor,),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                BaseOverlays().showConfirmationDialog(
                                    title: translate(context).are_you_sure_you_want_to_delete_the_location,
                                    onRightButtonPressed: (){
                                      BaseOverlays().dismissOverlay();
                                      controller.deleteLocation(id: controller.locationData?.value?.changeLocationRequestData?.sId??"");
                                    });
                              },
                              child: Icon(
                                CupertinoIcons.delete,
                                color: BaseColors.primaryColor,
                                size: 18.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: .5.h),
                    buildInfoItems(translate(context).street, controller.locationData?.value?.changeLocationRequestData?.street??""),
                    SizedBox(height: .5.h),
                    buildInfoItems(translate(context).building_villa, controller.locationData?.value?.changeLocationRequestData?.building??""),
                    SizedBox(height: .5.h),
                    buildInfoItems(translate(context).flat_villa_no, controller.locationData?.value?.changeLocationRequestData?.flat??""),
                    SizedBox(height: .5.h),
                    buildInfoItems(translate(context).landmark, controller.locationData?.value?.changeLocationRequestData?.landmark??""),
                    SizedBox(height: .5.h),
                    buildInfoItems(translate(context).mobile_no, controller.locationData?.value?.changeLocationRequestData?.mobileNo?.toString()??"",svgPath: "assets/images/copy 2.svg",onSvgClick: () async {
                      await Clipboard.setData(ClipboardData(text: controller.locationData?.value?.changeLocationRequestData?.mobileNo?.toString()??""));
                      Fluttertoast.showToast(msg: "Copied");
                    }),
                    SizedBox(
                      height: .5.h,
                    ),
                    buildInfoItems(translate(context).landline_no, controller.locationData?.value?.changeLocationRequestData?.landlineNo?.toString()??"",svgPath: "assets/images/copy 2.svg",onSvgClick: () async {
                      await Clipboard.setData(ClipboardData(text: controller.locationData?.value?.changeLocationRequestData?.landlineNo?.toString()??""));
                      Fluttertoast.showToast(msg: "Copied");
                    }),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: (controller.stepperIndex.value)+1,
                      color: BaseColors.primaryColor,
                      titles: controller.statusTime,
                      statuses: controller.statusTitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
