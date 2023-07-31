import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/account_deactivation_screen/controller/account_deactivation_controller.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class ActivationRequestDetailScreen extends StatefulWidget {
  final DeactivateData? data;
  final String? qrCode, bloodType;
  const ActivationRequestDetailScreen({Key? key, this.data, this.qrCode, this.bloodType}) : super(key: key);

  @override
  State<ActivationRequestDetailScreen> createState() => _ActivationRequestDetailScreenState();
}

class _ActivationRequestDetailScreenState extends State<ActivationRequestDetailScreen> with SingleTickerProviderStateMixin{
  AccountDeactivationController controller = Get.put(AccountDeactivationController());
  late TabController tabController;
  final List<String> pendingMeetingdates = ['July 2, 8:30PM', 'July 3, 10:30AM', ''];
  final List<String> pendingMeetingdates1 = ['July 2, 8:30PM', 'July 3, 10:30AM', 'July 4, 9:30AM'];

  final List<String> heading = [
    'Request\nRaised',
    'Evidence\nIn Review',
    'Completed',
  ];
  final List<String> heading1 = [
    'Request\nRaised',
    'Evidence\nIn Review',
    'Completed',
  ];
  @override
  void initState() {
    super.initState();
    controller.getActivationRequests();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.selectedTabIndex.value = tabController.index;
        controller.getActivationRequests();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).activation_request),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: BaseColors.borderColor)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: BaseColors.primaryColor),
                        ),
                        child: BaseImageNetwork(
                          link: widget.data?.deactivatedUser?.profilePic??"",
                          concatBaseUrl: true,
                          errorWidget: SvgPicture.asset(manSvg),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.data?.deactivatedUser?.name??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            const Divider(
                              color: BaseColors.borderColor,
                              height: 8.0,
                              thickness: 1.0,
                            ),
                            Text('#${widget.data?.deactivatedUser?.emirateId??""}', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            const Divider(
                              color: BaseColors.borderColor,
                              height: 8.0,
                              thickness: 1.0,
                            ),
                            buildInfoItems(translate(context).blood_type, widget.bloodType??"N/A"),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const SizedBox(height: 5),
                          Container(
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                // boxShadow: [getDeepBoxShadow()],
                                border: Border.all(
                                    color: BaseColors.primaryColor,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
                              child: Center(
                                child: Text(
                                  translate(context).deactivated.toUpperCase(),
                                  style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 12.sp),),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              showScanQrDialogue(context, false,data: widget.qrCode??"");
                            },child: QrImage(
                            data: widget.qrCode??"",
                            version: QrVersions.auto,
                            size: 70,
                            gapless: false,
                          ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildInfoItems(translate(context).deactivation_date, formatBackendDate(widget.data?.deactivatedUser?.createdAt??"")),),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: BaseColors.borderColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: buildInfoItems(translate(context).time, getFormattedTime(widget.data?.deactivatedUser?.createdAt??"")),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  buildPendingView(),
                  buildPendingView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabController,
      tabs:  [
        Tab(
          text: translate(context).pending,
        ),
        Tab(
          text: translate(context).completed,
        ),
      ],
    );
  }

  Widget buildPendingView() {
    return Obx(()=> (controller.list?.length??0) == 0
        ? BaseNoData()
        : ListView.builder(
        itemCount: controller.list?.length??0,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 40),
        itemBuilder: (context, index) {
          int stepperIndex = -5;
          controller.statusTime = [];
          controller.statusTitle = [];
          controller.list?[index]?.requestStatus?.toList().asMap().forEach((loopIndex,element) {
            if (element.name.toString().toLowerCase() != "rejected") {
              controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
              controller.statusTime.add(getFormattedTimeWithMonth(element.time??""));
              if (element.time.toString().isNotEmpty) {
                stepperIndex = loopIndex;
              }
            }else{
              if ((element.time??"").toString().isNotEmpty) {
                controller.statusTime = [];
                controller.statusTitle = [];
                controller.statusTitle.add(toBeginningOfSentenceCase(controller.list?[index]?.requestStatus?[0].name??"")??"");
                controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
                controller.statusTime.add(getFormattedTimeWithMonth(controller.list?[index]?.requestStatus?[0].time??""));
                controller.statusTime.add(getFormattedTimeWithMonth(element.time??""));
              }
            }
          });
          return Card(
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/Vector (1).svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(formatBackendDate(controller.list?[index]?.createdAt??""), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/time_icon.svg"),
                          SizedBox(width: 2.w),
                          Text(getFormattedTime(controller.list?[index]?.createdAt??""), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems(translate(context).deactivation_reason, controller.list?[index]?.deactivationReason??"N/A"))
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems(translate(context).required_evidence, controller.list?[index]?.requiredEvidance??""))
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems(translate(context).due_date, formatBackendDate(controller.list?[index]?.dueDate??"")))
                    ],
                  ),
                  const Divider(),
                  Visibility(
                    visible: (controller.list?[index]?.requestStatus?[2].time??"").toString().isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).activation, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/Vector (1).svg"),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(formatBackendDate(controller.list?[index]?.requestStatus?[2].time??"N/A"), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                              ],
                            ),
                            SizedBox(width: 20.w),
                            Row(
                              children: [
                                SvgPicture.asset("assets/images/time_icon.svg"),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(getFormattedTime(controller.list?[index]?.requestStatus?[2].time??"N/A"), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: (controller.list?[index]?.medCertDocument??"").toString().isNotEmpty,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translate(context).medical_certificate, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                        Row(
                          children: [
                            BaseIcons().view(concatBaseUrl: false,url: controller.list?[index]?.medCertDocument??"",rightMargin: 5),
                            BaseIcons().download(onRightButtonPressed: (){
                              BaseOverlays().dismissOverlay();
                              downloadFile(url: (controller.list?[index]?.medCertDocument??""),concatBaseUrl: false);
                            },leftMargin: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: (controller.list?[index]?.medCertDocument??"").toString().isNotEmpty,
                      child: const Divider()),
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
      ),
    );
  }
  Widget buildCompletedView() {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("12/07/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/time_icon.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("09:13pm", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/report.svg"),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(child: buildInfoItems(translate(context).deactivation_reason, "Suspected to have Covid-19 symptoms and is deactivated for the awareness of the students."))
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/report.svg"),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(child: buildInfoItems(translate(context).required_evidence, "1. RT- PCR Report"))
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/Vector (1).svg"),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(child: buildInfoItems(translate(context).due_date, "12/07/2022"))
                ],
              ),
              const Divider(),
              Text(translate(context).activation, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("12/07/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/time_icon.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("09:13pm", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate(context).medical_certificate, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                  Row(
                    children: [
                      GestureDetector(onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return OpenPdfPopup(title: "");
                          },
                        );
                      },child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,size: 20.sp,)),
                      const SizedBox(width: 10,),
                      Icon(Icons.download_for_offline,color: BaseColors.primaryColor,size: 20.sp,)
                    ],
                  ),
                ],
              ),
              const Divider(),
              StepProgressView(
                width: MediaQuery.of(context).size.width,
                curStep: 3,
                color: BaseColors.primaryColor,
                titles: pendingMeetingdates1,
                statuses: heading1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
