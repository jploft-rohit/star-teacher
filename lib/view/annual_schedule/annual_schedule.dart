import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/view/annual_schedule/view_calendar.dart';


class AnnualScheduleScreen extends StatefulWidget {
  const AnnualScheduleScreen({Key? key}) : super(key: key);

  @override
  State<AnnualScheduleScreen> createState() => _AnnualScheduleScreenState();
}

class _AnnualScheduleScreenState extends State<AnnualScheduleScreen> with TickerProviderStateMixin{
  late TabController tabController;
  int selectedIndex = 0;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedIndex,
    );
    tabController.addListener(() {
      int pos = tabController.index;
      if (selectedIndex != pos) setState(() => selectedIndex = pos);
    });
    super.initState();
  }
  String? initialSchool;
  final Color greenBG = const Color(0xffE7FCE9);
  final Color blueBG = const Color(0xffEDF5FD);
  final Color orangeBG = const Color(0xffFFF0E1);
  final Color greenICON = const Color(0xff19AD54);
  final Color blueICON = const Color(0xff5675B1);
  final Color orangeICON = const Color(0xffE29249);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar:BaseAppBar(
        title: 'Annual Schedule',
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomDropDown(
              initialValue: initialSchool,
              hintText: "Ignite Public School",
              listData: ["Ignite Public School","UAE Public School"],
              onChange: (value) {
                setState(() {
                  initialSchool=value;
                });
              },
              topPadding: 5,
              bottomPadding: 5,
              icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
            ),
            SizedBox(height: 1.h,),
            BaseToggleTabBar(
                controller: tabController, tabs: [
              BaseTabButton(title: 'Holidays', isSelected: tabController.index==0,type: toggleLargeButton,),
              BaseTabButton(title: 'Exams', isSelected: tabController.index==1,type: toggleLargeButton,),
            ]),
            SizedBox(height: 1.5.h,),
            Expanded(child: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      card(
                        icon: 'summer',
                        bg: greenBG,
                        iconColor: greenICON,
                        title: 'Summer Vacations',
                        time: 'June 15 to July 15',
                        context: context
                      ),
                      card(
                        icon: 'winter',
                        bg: blueBG,
                        iconColor: blueICON,
                        title: 'Winter Vacations',
                        time: 'January 10 to February 10',
                          context: context
                      ),
                      card(
                        icon: 'party',
                        bg: blueBG,
                        iconColor: blueICON,
                        title: 'New Year’s Day',
                        time: 'January 1',
                          context: context
                      ),
                      card(
                        icon: 'eid',
                        bg: greenBG,
                        iconColor: greenICON,
                        title: 'Eid al Fitr',
                        time: 'April 20, 21, 22 and 23',
                          context: context
                      ),
                      card(
                        icon: 'arafat',
                        bg: orangeBG,
                        iconColor: orangeICON,
                        title: 'Arafat Day',
                        time: 'June 27',
                          context: context
                      ),
                      card(
                        icon: 'eid',
                        bg: orangeBG,
                        iconColor: orangeICON,
                        title: 'June 28, 29, 3',
                        time: 'Eid al Adha',
                          context: context
                      ),
                      card(
                        icon: 'party',
                        bg: blueBG,
                        iconColor: blueICON,
                        title: 'July 19',
                        time: 'Islamic New Year',
                          context: context
                      ),
                      card(
                        icon: 'birthday',
                        bg: greenBG,
                        iconColor: greenICON,
                        title: 'September 27',
                        time: 'The Prophet Muhammad’s (PBUH) birthday',
                          context: context
                      ),
                      card(
                        icon: 'commemoration',
                        bg: orangeBG,
                        iconColor: orangeICON,
                        title: 'December 1',
                        time: 'Commemoration Day',
                          context: context
                      ),
                      card(
                        icon: 'national',
                        bg: orangeBG,
                        iconColor: orangeICON,
                        title: 'December 2, 3',
                        time: 'National Day',
                          context: context
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      card(
                        icon: 'file',
                        bg: greenBG,
                        iconColor: greenICON,
                        title: 'Term 1',
                        time: 'January 01 to January 08',
                          context: context
                      ),
                      card(
                        icon: 'file',
                        bg: blueBG,
                        iconColor: blueICON,
                        title: 'Term 2',
                        time: 'March 01 to March 08',
                          context: context
                      ),
                      card(
                        icon: 'file',
                        bg: blueBG,
                        iconColor: blueICON,
                        title: 'Half Yearly',
                        time: 'June 15 to July 15',
                          context: context
                      ),
                      card(
                        icon: 'file',
                        bg: greenBG,
                        iconColor: greenICON,
                        title: 'Term 3',
                        time: 'September 01 to September 08',
                          context: context
                      ),
                      card(
                        icon: 'file',
                        bg: blueBG,
                        iconColor: blueICON,
                        title: 'Term 4',
                        time: 'November 01 to November 08',
                          context: context
                      ),
                      card(
                        icon: 'file',
                        bg: greenBG,
                        iconColor: greenICON,
                        title: 'Annual Exam',
                        time: 'December 20 to December 30',
                          context: context
                      ),
                    ],
                  ),
                )
              ],
            )
            )

          ],
        ),
      ),
    );
  }
}
Widget card({
  required String icon,
  required Color bg,
  required Color iconColor,
  required String title,
  required String time,
  required BuildContext context,
bool isNextSCreen = true
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: GestureDetector(
      onTap: () {
        if(isNextSCreen)
          {
            Get.to(AnnualViewCalendarScreen(title: title, icon: icon, time: time, bg: bg, iconColor: iconColor));
          }
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SvgPicture.asset(
                  'assets/images/$icon.svg',
                  height: 15,
                  width: 15,
                  color: iconColor,
                ),
              ),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText(
                    title,
                    17.sp,
                    Colors.black,
                    FontWeight.bold,
                  ),
                  Spacer(),
                  addText(
                    time,
                    15.sp,
                    Colors.black.withOpacity(0.6),
                    FontWeight.w400,
                  ),
                ],
              ),
              Spacer(),
              SvgPicture.asset("assets/images/calender_date.svg"),
            ],
          ),
        ),
      ),
    ),
  );
}

