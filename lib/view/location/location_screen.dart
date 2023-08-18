import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/intl/intl.dart';
import 'package:staff_app/view/location/controller/location_controller.dart';
import 'package:staff_app/view/location/create_user_location.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import '../../utility/sizes.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> with SingleTickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  LocationController controller = Get.put(LocationController());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.selectedTabIndex.value = tabController.index;
        controller.getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(()=>(controller.list??[]).isNotEmpty ? SizedBox() : BaseFloatingActionButton(
        onTap: (){
          Get.to(const CreateUserLocation());
        },
        title: 'Create',
      ),
      ),
      appBar: BaseAppBar(title: translate(context).location),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Obx(()=>Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: BaseColors.borderColor
                        )
                    ),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: -4),
                      contentPadding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp, bottom: 15.sp),
                      leading: Container(
                        height: double.infinity,
                        width: 18.w,
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: BaseImageNetwork(
                          link: controller.locationUser?.value?.profilePic??"",
                          concatBaseUrl: true,
                          width: 9.w,
                          errorWidget: SvgPicture.asset(manSvg),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(toBeginningOfSentenceCase(controller.locationUser?.value?.name??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          SizedBox(height: 2),
                          Text("#${controller.locationUser?.value?.emirateId??"N/A"}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          SizedBox(height: 2),
                          Text(toBeginningOfSentenceCase(controller.locationUser?.value?.role?.name??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                        ],
                      ),
                      trailing: GestureDetector(onTap: (){
                        showScanQrDialogue(context, false);
                      },child: BaseQr(data: controller.locationUser?.value?.barcode??"")),
                    ),
                  ),
                  BaseToggleTabBar(controller: tabController, tabs: [
                    BaseTabButton(title: "Home", isSelected: controller.selectedTabIndex.value == 0, type: toggleLargeButton,),
                    BaseTabButton(title: "Emergency", isSelected: controller.selectedTabIndex.value == 1, type: toggleLargeButton,),
                  ],topMargin: 2.h,bottomMargin: 0),
                  (((controller.list??[]).isEmpty))
                      ? BaseNoData(message: "No Location Data Found,",topMargin: 35.h)
                      : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on_outlined,color: BaseColors.primaryColor,size: 20.sp),
                            Text("Location : ",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Expanded(child: Text((controller.list?.first?.address??""),style: TextStyle(fontSize: 14.sp,color: BaseColors.primaryColor,fontWeight: FontWeight.bold),)),
                      ]),
                        SizedBox(height: 2.h),
                      GestureDetector(
                        onTap: (){
                          BaseOverlays().viewPhoto(url: (controller.list??[]).isNotEmpty ? controller.list?.first?.document??"" : "",);
                        },
                        child: Container(
                          height: 25.h,
                          width: 100.w,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(color: BaseColors.primaryColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: BaseImageNetwork(
                            link: (controller.list??[]).isNotEmpty ? controller.list?.first?.document??"" : "",
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                            borderRadius: 13,
                            errorWidget: SvgPicture.asset(homeSvg, fit: BoxFit.scaleDown),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).sector, controller.list?.first?.sector??""),
                              SizedBox(height: .5.h),
                              (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).area, controller.list?.first?.area??""),
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
                                      return ConfirmationDialog(msg: translate(context).are_you_sure_you_want_to_change_the_location,
                                        isShowBtn: true,
                                        onTap: (){
                                          BaseOverlays().dismissOverlay();
                                          Get.to(CreateUserLocation(isUpdating: true,data: controller.list?.first));
                                       },
                                     );
                                    },
                                  );
                                },
                                child: Image.asset(editPng, height: 18.sp, color: BaseColors.primaryColor,),
                              ),
                              SizedBox(width: 3.w),
                              GestureDetector(
                                onTap: (){
                                  BaseOverlays().showConfirmationDialog(
                                      title: translate(context).are_you_sure_you_want_to_delete_the_location,
                                      onRightButtonPressed: (){
                                        BaseOverlays().dismissOverlay();
                                        controller.deleteData(id: controller.list?.first?.sId??"");
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
                        (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).street, controller.list?.first?.street??""),
                      SizedBox(height: .5.h),
                        (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).building_villa, controller.list?.first?.buildingVilla??""),
                      SizedBox(height: .5.h),
                        (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).flat_villa_no, controller.list?.first?.flatVillaNo??""),
                      SizedBox(height: .5.h),
                        (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).landmark, controller.list?.first?.landmark??""),
                      SizedBox(height: .5.h),
                      (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).mobile_no, controller.list?.first?.mobile?.toString()??"",svgPath: "assets/images/copy 2.svg",onSvgClick: () async {
                        await Clipboard.setData(ClipboardData(text: controller.list?.first?.mobile.toString().substring(0,15)??""));
                        Fluttertoast.showToast(msg: "Copied");
                      }),
                      SizedBox(height: .5.h),
                      (controller.list??[]).isEmpty ? SizedBox() : buildInfoItems(translate(context).landline_no, controller.list?.first?.landline?.toString()??"",svgPath: "assets/images/copy 2.svg",onSvgClick: () async {
                        await Clipboard.setData(ClipboardData(text: controller.list?.first?.landline.toString().substring(0,15)??""));
                        Fluttertoast.showToast(msg: "Copied");
                      }),
                      SizedBox(height: 1.5.h),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
