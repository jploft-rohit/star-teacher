import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/awareness_courses_screen/start_quiz_popup.dart';

class AwarenesCoursesView extends StatefulWidget {
  const AwarenesCoursesView({Key? key}) : super(key: key);

  @override
  State<AwarenesCoursesView> createState() => _AwarenesCoursesViewState();
}

class _AwarenesCoursesViewState extends State<AwarenesCoursesView> {
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', '', ''];

  final List<String> heading = [
    'Received',
    'Viewed',
    'Quiz',
    'Completed'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            showGeneralDialog(
              context: context,
              pageBuilder:  (context, animation, secondaryAnimation) {
                return StartQuizPopup();
              },
            );
          },
          child: Card(
            elevation: 3.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Stack(
                    children: [
                      Image.asset("assets/images/course_img.png"),
                      Center(
                        child: Container(
                          height: 200.0,
                          width: Get.width,
                          color: Colors.black.withOpacity(0.5),
                          child: SvgPicture.asset("assets/images/play_img.svg", fit: BoxFit.scaleDown,),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    children: [
                      buildInfoItems(translate(context).description, "New Uniform need to be purchase for sania we have new uniform for the Grade 6 Stars"),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              buildInfoItems(translate(context).file, "attendence.exl"),
                              SizedBox(
                                width: 2.w,
                              ),
                              SvgPicture.asset("assets/images/salary_slip_download_img.svg", height: 16.sp,)
                            ],
                          ),
                          Container(
                            height: 15.0,
                            width: 1,
                            color: CustomColors.borderColor,
                          ),
                          buildInfoItems(translate(context).due_date, "30/06/2022")
                        ],
                      ),
                      Divider(),
                      StepProgressView(
                        width: MediaQuery.of(context).size.width,
                        curStep: 4,
                        color: CustomColors.primaryColor,
                        titles: pendingMeetingdates,
                        statuses: heading,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
