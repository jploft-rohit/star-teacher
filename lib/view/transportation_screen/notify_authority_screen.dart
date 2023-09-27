import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/custom_models/notify_authority_model.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/constant_images.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/transportation_screen/controller/transportation_screen_ctrl.dart';
import 'package:staff_app/view/transportation_screen/notify_school_administrator.dart';

class NotifyAuthorityForBusScreen extends StatefulWidget {
  const NotifyAuthorityForBusScreen({Key? key}) : super(key: key);

  @override
  State<NotifyAuthorityForBusScreen> createState() => _NotifyAuthorityForBusScreenState();
}

class _NotifyAuthorityForBusScreenState extends State<NotifyAuthorityForBusScreen> {

  TransportationScreenCtrl controller = Get.find<TransportationScreenCtrl>();
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();
  final list = <NotifyAuthority>[].obs;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    list.addAll(
      [
        NotifyAuthority(
          option: 'I will be absent today.',
          dayType: 'today',
          isYes: true,
        ),
        NotifyAuthority(
          option: 'Going to school by my own vehicle.',
          dayType: 'today',
          isYes: false,
        ),
        NotifyAuthority(
          option: 'Returning home by my own vehicle.',
          dayType: 'today',
          isYes: false,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).notify_authority),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
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
                  leading: Container(
                    height: 20.w,
                    width: 17.w,
                    padding: EdgeInsets.only(top: 7.sp, bottom: 7.sp, left: 7.sp, right: 7.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BaseImageNetwork(
                      link: myProfileCtrl.response.value.data?.profilePic??"",
                      concatBaseUrl: false,
                      borderRadius: 10,
                      errorWidget: SvgPicture.asset(manSvg),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(myProfileCtrl.response.value.data?.name??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      const SizedBox(height: 2),
                      Text("#${myProfileCtrl.response.value.data?.emirateId?.toString()??"N/A"}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      const SizedBox(height: 2),
                      Text(toBeginningOfSentenceCase(myProfileCtrl.response.value.data?.designation??(translate(context).teacher))??(translate(context).teacher), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  trailing: GestureDetector(onTap: (){
                    showScanQrDialogue(context, false);
                  },child: BaseQr(data: myProfileCtrl.response.value.data?.barcode?.toString()??"")),
                ),
                ),
              ),
              SizedBox(height: 2.h),
              Text("${translate(context).select_your_option} :", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp),),
              Obx(()=>Column(
                  children: List.generate(list.length, (index) {
                    NotifyAuthority notifyAuthority = list[index];
                    return Column(
                      children: [
                        buildOptionTile(notifyAuthority.option,
                            list[index].isYes ?? false, () {
                          NotifyAuthority notifyAuthority = list[index];
                          notifyAuthority.isYes = !(notifyAuthority.isYes ?? false);
                          list[index] = notifyAuthority;
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(child: BaseButton(title: "SUBMIT", onPressed: (){
                if (list.where((element) => element.isYes ?? false).toList().isEmpty) {
                  baseToast(message: "Please Select At Least 1 Option");
                }else{
                  showNotifyAuthorityDialogue();
                }
              },btnType: largeButton))
            ],
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
          Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp),),
          
        ],
      ),
    );
  }
  Widget buildTile1(String title) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            controller.optionsList.add(LocalOptionModel(option: ""));
          },
          child: Container(
            width: Get.width,
            margin: const EdgeInsets.only(bottom: 8.0),
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: BaseColors.primaryColor)
            ),
            child: Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp),),
          ),
        ),
        Align(alignment: AlignmentDirectional.centerEnd,child: SvgPicture.asset(checkEnableSvg)),
      ],
    );
  }

  Widget buildOptionTile(label, isYes, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: marginSymetric(0, 4),
        decoration: BoxDecoration(
          borderRadius: radiusAll(6),
          border: Border.all(color: ColorConstants.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            addText(label, getNormalTextFontSIze() + 1,
                ColorConstants.primaryColor, FontWeight.w400),
            isYes
                ? Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.primaryColor,
                  boxShadow: [getDeepBoxShadow()],
                  border:
                  Border.all(color: ColorConstants.white, width: 2)),
              child: const Icon(
                Icons.check,
                color: ColorConstants.white,
                size: 15,
              ),
            )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  void showNotifyAuthorityDialogue() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: iconButton(() {
                                Get.back();
                              }, StarIcons.closeIconBlack),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 20),
                              child: Center(
                                child: addAlignedText(
                                    'Are you sure you want to notify\nthe school administration?',
                                    18,
                                    Colors.black,
                                    FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        spaceheight(2.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: list.where((element) => element.isYes ?? false).toList().length,
                          itemBuilder: (BuildContext context, int index) {
                            NotifyAuthority notifyAuthority = list.where((element) => element.isYes ?? false).toList()[index];
                            return Column(
                              children: [
                                Container(padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(borderRadius: radiusAll(10), color: ColorConstants.primaryColorLight),
                                  child: addText(notifyAuthority.option ?? translate(context).na, getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w400),
                                ),
                                spaceheight(1.h),
                                Obx((() => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        notifyAuthority.dayType = 'today';
                                        int index = list.indexWhere((element) =>
                                        element.option == notifyAuthority.option);
                                        list[index] = notifyAuthority;
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment:
                                            AlignmentDirectional.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: list.firstWhere((element) =>
                                                element.option == notifyAuthority.option).dayType == 'today' ? ColorConstants.primaryColor : ColorConstants.lightGreyColor,
                                                boxShadow: [
                                                  getDeepBoxShadow()
                                                ],
                                                border: Border.all(
                                                    color: ColorConstants.white,
                                                    width: 2,
                                                ),
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: ColorConstants.white,
                                              size: 15,
                                            ),
                                          ),
                                          spacewidth(0.5.h),
                                          addText(
                                              'For Today',
                                              getSmallTextFontSIze(),
                                              ColorConstants.black,
                                              FontWeight.w400,
                                          )
                                        ],
                                      ),
                                    ),
                                    spacewidth(2.h),
                                    GestureDetector(
                                      onTap: () {
                                        notifyAuthority.dayType = 'multiple';
                                        int index = list.indexWhere((element) =>
                                        element.option == notifyAuthority.option);
                                        list[index] = notifyAuthority;
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment:
                                            AlignmentDirectional.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: list.firstWhere((element) =>
                                                element.option == notifyAuthority.option).dayType == 'multiple'
                                                    ? ColorConstants.primaryColor
                                                    : ColorConstants.lightGreyColor,
                                                boxShadow: [
                                                  getDeepBoxShadow()
                                                ],
                                                border: Border.all(
                                                    color: ColorConstants.white,
                                                    width: 2,
                                                ),
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: ColorConstants.white,
                                              size: 15,
                                            ),
                                          ),
                                          spacewidth(0.5.h),
                                          addText(
                                              'For Multiple Days',
                                              getSmallTextFontSIze(),
                                              ColorConstants.black,
                                              FontWeight.w400,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                                spaceheight(1.5.h),
                                Obx(() => Visibility(
                                    visible: list.firstWhere((element) =>
                                    element.option == notifyAuthority.option).dayType == 'multiple',
                                    child: Row(
                                      children: [
                                        spacewidth(2.h),
                                        Expanded(
                                            child: addDetailRow('From', list.firstWhere((element) => element.option == notifyAuthority.option).fromDate ?? translate(context).dd_mm_yyyy,
                                                iconButton(() {
                                                  showDatePicker(
                                                      context: context,
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context).copyWith(
                                                          colorScheme: const ColorScheme.light(
                                                            primary: BaseColors.primaryColor,
                                                          ),
                                                        ),
                                                        child: child!,
                                                      );
                                                    },
                                                      initialDate: DateTime.now(),
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime((DateTime.now().year+50),1,1),
                                                  ).then((dateTime) {
                                                    if (dateTime != null) {
                                                      if ((notifyAuthority.toDate??"").isNotEmpty) {
                                                        DateTime endDate = DateTime.parse(flipDate(date: notifyAuthority.toDate??""));
                                                        if (endDate.isAfter(dateTime)) {
                                                          notifyAuthority.fromDate = formatFlutterDateTime(
                                                            flutterDateTime: dateTime,
                                                            getDayFirst: true
                                                          );
                                                          notifyAuthority.fromDateApi = formatFlutterDateTime(
                                                              flutterDateTime: dateTime,
                                                              getDayFirst: false
                                                          );
                                                        }else{
                                                          baseToast(message: "\"From Date\" ${translate(context).cant_be_less_than} \"To Date\"");
                                                        }
                                                      }else{
                                                        notifyAuthority.fromDate = formatFlutterDateTime(
                                                            flutterDateTime: dateTime,
                                                            getDayFirst: true
                                                        );
                                                        notifyAuthority.fromDateApi = formatFlutterDateTime(
                                                            flutterDateTime: dateTime,
                                                            getDayFirst: false
                                                        );
                                                      }
                                                      int index = list.indexWhere((element) =>
                                                      element.option == notifyAuthority.option);
                                                      list[index] = notifyAuthority;
                                                    }
                                                  });
                                                }, "assets/images/calender_date.svg"))),
                                        Expanded(
                                            child: addDetailRow(
                                                'To',
                                                list.firstWhere((element) => element.option == notifyAuthority.option).toDate ?? translate(context).dd_mm_yyyy,
                                                iconButton(() {
                                                  showDatePicker(
                                                    context: context,
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context).copyWith(
                                                          colorScheme: const ColorScheme.light(
                                                            primary: BaseColors.primaryColor,
                                                          ),
                                                        ),
                                                        child: child!,
                                                      );
                                                    },
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime((DateTime.now().year+50),1,1),
                                                  ).then((dateTime) {
                                                    if (dateTime != null) {
                                                      if ((notifyAuthority.fromDate??"").isNotEmpty) {
                                                        DateTime endDate = DateTime.parse(flipDate(date: notifyAuthority.fromDate??""));
                                                        if (endDate.isBefore(dateTime)) {
                                                          notifyAuthority.toDate = formatFlutterDateTime(
                                                              flutterDateTime: dateTime,
                                                              getDayFirst: true
                                                          );
                                                          notifyAuthority.toDateApi = formatFlutterDateTime(
                                                              flutterDateTime: dateTime,
                                                              getDayFirst: false
                                                          );
                                                        }else{
                                                          baseToast(message: "\"To Date\" ${translate(context).cant_be_less_than} \"To Date\"");
                                                        }
                                                      }else{
                                                        notifyAuthority.toDate = formatFlutterDateTime(
                                                            flutterDateTime: dateTime,
                                                            getDayFirst: true
                                                        );
                                                        notifyAuthority.toDateApi = formatFlutterDateTime(
                                                            flutterDateTime: dateTime,
                                                            getDayFirst: false
                                                        );
                                                      }
                                                      int index = list.indexWhere((element) =>
                                                      element.option == notifyAuthority.option);
                                                      list[index] = notifyAuthority;
                                                    }
                                                  });
                                                }, "assets/images/calender_date.svg"),
                                            ),
                                        ),
                                        spacewidth(2.h),
                                      ],
                                    ))),
                                index == list.where((element) => element.isYes ?? false).toList().length - 1
                                    ? const SizedBox()
                                    : buildDivider(),
                              ],
                            );
                          },
                        ),
                        spaceheight(2.0.h),
                        BaseButton(
                            btnType: 'popup',
                            title: translate(context).notify,
                            onPressed: () {
                              Get.back();
                              controller.notifyTransportAuthority(list: list);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: Get.context!,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }



}
