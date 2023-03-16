import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_submission_screen.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class SubmittedAssignmentView extends StatefulWidget {
  const SubmittedAssignmentView({Key? key}) : super(key: key);

  @override
  State<SubmittedAssignmentView> createState() => _SubmittedAssignmentViewState();
}

class _SubmittedAssignmentViewState extends State<SubmittedAssignmentView> with TickerProviderStateMixin {
  TabController? tabCtrl;
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', ''];
  final List<String> pendingMeetingdates1 = ['July 2,\n8:30PM', 'July 3,\n10:30AM', 'July 4,\n10:30AM'];

  final List<String> heading = [
    'Submission\nReceived',
    'In Review',
    'Completed',
  ];

  @override
  void initState() {
    tabCtrl = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).submitted_assignments, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){

            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: CustomColors.primaryColor,
            ),
          ),
          Text(translate(context).create_task, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText("Assignment Title", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/report.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(child: buildInfoItems(translate(context).description, "Please upload the feedback of all the stars in suggested class into the excel worksheet."))
                      ],
                    ),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/document 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              buildInfoItems(translate(context).serial_no, "C01111"),
                              SizedBox(
                                width: 5.w,
                              ),
                              InkWell(
                                onTap: (){
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder:  (context, animation, secondaryAnimation) {
                                      return OpenPdfPopup(title: "");
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: CustomColors.primaryColor,
                                  size: 19.sp,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  pendingView(),
                  completedView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 30,
      width: 100.w,
      decoration: BoxDecoration(
          color: CustomColors.white,
          boxShadow: [
            getBoxShadow()
          ],
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        onTap: (value){

        },
        padding: const EdgeInsets.all(2),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Color(0xff424242),
        tabs:  [
          Tab(
            text: translate(context).pending,
          ),
          Tab(
            text: translate(context).completed,
          ),
        ],
      ),
    );
  }
  Widget pendingView(){
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Get.to(AssignmentSubmissionScreen());
          },
          child: Card(
            elevation: 3.0,
            margin: EdgeInsets.only(bottom: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: CustomColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SvgPicture.asset(manSvg,height: 30,),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sania", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),),
                            SizedBox(
                              height: .2.h,
                            ),
                            Text("#562665", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                            SizedBox(
                              height: .2.h,
                            ),
                            Text("G3-H1", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: 2,
                    color: CustomColors.primaryColor,
                    titles: pendingMeetingdates,
                    statuses: heading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget completedView(){
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: EdgeInsets.only(bottom: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: CustomColors.primaryColor
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SvgPicture.asset(manSvg,height: 30,),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sania", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),),
                          SizedBox(
                            height: .2.h,
                          ),
                          Text("#562665", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                          SizedBox(
                            height: .2.h,
                          ),
                          Text("G3-H1", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 3,
                  color: CustomColors.primaryColor,
                  titles: pendingMeetingdates1,
                  statuses: heading,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
