import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/awareness_courses_screen/start_quiz_popup.dart';

class AwarenessCoursesScreen extends StatefulWidget {
  const AwarenessCoursesScreen({Key? key}) : super(key: key);

  @override
  State<AwarenessCoursesScreen> createState() => _AwarenessCoursesScreenState();
}

class _AwarenessCoursesScreenState extends State<AwarenessCoursesScreen> {
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', '', ''];

  final List<String> heading = [
    'Received',
    'Viewed',
    'Quiz',
    'Completed'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Awareness & Courses"),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {},
        title: 'Create\nAwareness\n& Course',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: BaseColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
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
                                buildInfoItems("Description", "New Uniform need to be purchase for sania we have new uniform for the Grade 6 Stars"),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        buildInfoItems("File", "attendence.exl"),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        SvgPicture.asset("assets/images/salary_slip_download_img.svg", height: 16.sp,)
                                      ],
                                    ),
                                    Container(
                                      height: 15.0,
                                      width: 1,
                                      color: BaseColors.borderColor,
                                    ),
                                    buildInfoItems("Due Date", "30/06/2022")
                                  ],
                                ),
                                Divider(),
                                StepProgressView(
                                  width: MediaQuery.of(context).size.width,
                                  curStep: 4,
                                  color: BaseColors.primaryColor,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
