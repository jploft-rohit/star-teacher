import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/custom_filter_dropdown.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/filter_textformfield.dart';
import 'package:staff_app/utility/utility.dart';

import '../../utility/images_icon_path.dart';

class ExamTimeTableScreen extends StatefulWidget {
  const ExamTimeTableScreen({Key? key}) : super(key: key);

  @override
  State<ExamTimeTableScreen> createState() => _ExamTimeTableScreenState();
}

class _ExamTimeTableScreenState extends State<ExamTimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    final list = [
      [
        'Mon',
        '05/06/23',
        '09:00 - 10:00',
        'English',
      ],
      [
        'Thu',
        '05/06/23',
        '09:00 - 10:00',
        'English',
      ],
      [
        'Mon',
        '05/06/23',
        '09:00 - 10:00',
        'English',
      ],
      [
        'Wed',
        '05/06/23',
        '09:00 - 10:00',
        'English',
      ]
    ];
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: BaseAppBar(title: 'Exam Time Table'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: ColorConstants.borderColor
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialSchool,
                        hintText: DummyLists.initialSchool??"School",
                        listData: DummyLists.schoolData,
                        onChange: (value) {
                          setState(() {
                            DummyLists.initialSchool = value;
                          });
                        },
                        icon: classTakenSvg,
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: "Section",
                        hintText: DummyLists.initialGrade??"Section",
                        listData: DummyLists.classRoomData,
                        onChange: (value) {
                          setState(() {
                            DummyLists.initialGrade = value;
                          });
                        },
                        icon: classTakenSvg,
                      ),
                      Container(
                        child: VerticalDivider(width: 1),
                        height: 4.h,
                        width: 1,
                      ),
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialClass,
                        hintText: DummyLists.initialSchool??"Class",
                        listData: DummyLists.classData,
                        onChange: (value) {
                          setState(() {
                            DummyLists.initialClass = value;
                          });
                        },
                        icon: classTakenSvg,
                      ),
                    ],
                  ),
                  Divider(height: 1,
                      thickness: 1),
                  FilterTextFormField(
                    onChange: (String val) {},
                    hintText: "Search by name",
                    keyBoardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: addText(
                'Exam ',
                14,
                Colors.black,
                FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 1,
              width: Get.width,
              color: Color(0xFFEBEBEB),
            ),
            Table(
              columnWidths: {
                1: FlexColumnWidth(1.2),
                2: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 5),
                        child: Text("DATE",textAlign: TextAlign.center, style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w900)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 5),
                        child: Text("DAY",textAlign: TextAlign.center, style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w900)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 5),
                        child: Text("TIME",textAlign: TextAlign.center, style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w900)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 5),
                        child: Text("SUBJECT",textAlign: TextAlign.center, style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w900)),
                    ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 1,
              width: Get.width,
              color: Color(0xFFEBEBEB),
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder(
                horizontalInside: BorderSide(color: Color(0xFFEBEBEB)),
                verticalInside: BorderSide(color: Color(0xFFEBEBEB)),
              ),
              columnWidths: {
                1: FlexColumnWidth(1.2),
                2: FlexColumnWidth(2),
              },
              children: List.generate(
                list.length,
                    (index) => TableRow(
                  children: List.generate(
                    4,
                        (myindex) => TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 5),
                        child: Text(list[index][myindex],textAlign: TextAlign.center, style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400),),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              width: Get.width,
              color: Color(0xFFEBEBEB),
            ),
          ],
        ),
      ),
    );
}
}
