import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  List<Map<String, dynamic>> list = [
    {
      "title": "15",
      "subTitle": "Pending Task",
    },
    {
      "title": "25",
      "subTitle": "Unclosed Compliant",
    },
    {
      "title": "25",
      "subTitle": "Stars Evaluation Pending",
    },
    {
      "title": "18",
      "subTitle": "Assignment to Review",
    },
    {
      "title": "97%",
      "subTitle": "Attendance Record",
    },
    {
      "title": "4.3",
      "subTitle": "Performance",
    },
    {
      "title": "299",
      "subTitle": "Linked Stars",
    },
    {
      "title": "3",
      "subTitle": "Allocated Schools",
    },
    {
      "title": "13/20",
      "subTitle": "Total Classes Attended This Week",
    },
    {
      "title": "10",
      "subTitle": "Average of Interacting with chatting",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGrids(),
    );
  }
  Widget buildGrids(){
    return GridView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(5),
        child: buildItem(index),
      ),
      itemCount: 10,
    );
  }

  buildItem(int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: CustomColors.darkShadowColor,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(0, 3)
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(list[index]['title'], style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 25.sp),),
          SizedBox(
            height: 1.h,
          ),
          Text(list[index]['subTitle'], style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
