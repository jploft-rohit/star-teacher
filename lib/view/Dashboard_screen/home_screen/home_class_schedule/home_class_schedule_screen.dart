import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_day_schedule_view.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_week_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/day_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/notifiy_authority_popup.dart';
import 'package:staff_app/view/class_schedule_screen/week_schedule_view.dart';

class HomeClassScheduleScreen extends StatefulWidget {
  final int index;
  final bool isViewAll;
  const HomeClassScheduleScreen({Key? key, required this.index, this.isViewAll = false}) : super(key: key);

  @override
  State<HomeClassScheduleScreen> createState() => _HomeClassScheduleScreenState();
}

class _HomeClassScheduleScreenState extends State<HomeClassScheduleScreen> {
  List<Widget> screenList = [
    const HomeDayScheduleView(),
    const HomeWeekScheduleView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.index == 0 ? "Classes Taken" : widget.index == 1? widget.isViewAll ? "Today Schedule" : "This Week":"Today Schedule"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: "Select School",
                listData:DummyLists.schoolData,
                onChange: (value) {
                  setState(() {
                    DummyLists.initialSchool=value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
              ),
              SizedBox(
                height: 2.h,
              ),
              screenList[widget.index],
            ],
          ),
        ),
      ),
    );
  }
}
