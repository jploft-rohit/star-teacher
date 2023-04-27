import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class ActivationRequestDetailScreen extends StatefulWidget {
  const ActivationRequestDetailScreen({Key? key}) : super(key: key);

  @override
  State<ActivationRequestDetailScreen> createState() => _ActivationRequestDetailScreenState();
}

class _ActivationRequestDetailScreenState extends State<ActivationRequestDetailScreen> with SingleTickerProviderStateMixin{
  TabController? controller;
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
    controller = TabController(length: 2, vsync: this);
    super.initState();
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
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: BaseColors.primaryColor),
                        ),
                        child: SvgPicture.asset(manSvg,),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Nawaz Alam', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            const Divider(
                              color: BaseColors.borderColor,
                              height: 8.0,
                              thickness: 1.0,
                            ),
                            Text('#632541', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            const Divider(
                              color: BaseColors.borderColor,
                              height: 8.0,
                              thickness: 1.0,
                            ),
                            buildInfoItems(translate(context).blood_type, 'A+'),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 4),
                              child: Center(
                                child: Text(
                                  translate(context).deactivated.toUpperCase(),
                                  style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 12.sp),),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          GestureDetector(
                              onTap: (){
                                showScanQrDialogue(context, false);
                              },child: SvgPicture.asset(qrCodeSvg, height: 5.h,))
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
                          child: buildInfoItems(translate(context).deactivation_date, "12-07-2022"),),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: BaseColors.borderColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: buildInfoItems(translate(context).time, "9:30 am"),
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
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildPendingView(),
                  buildCompletedView(),
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
      controller: controller,
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
                      GestureDetector(
                          onTap: (){
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
                curStep: 2,
                color: BaseColors.primaryColor,
                titles: pendingMeetingdates,
                statuses: heading,
              ),
            ],
          ),
        ),
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
