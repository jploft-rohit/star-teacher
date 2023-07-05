import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/view/exam_time_table/controller/exam_time_table_controller.dart';

class ExamTimeTableScreen extends StatefulWidget {
  const ExamTimeTableScreen({Key? key}) : super(key: key);

  @override
  State<ExamTimeTableScreen> createState() => _ExamTimeTableScreenState();
}

class _ExamTimeTableScreenState extends State<ExamTimeTableScreen> {

  ExamTimeTableController controller = Get.put(ExamTimeTableController());

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
            BaseSchoolDropDown(
              controller: controller.selectedSchoolController,
              onChanged: (val){
                controller.selectedSchoolController.text = val.name??"";
                controller.selectedSchoolId.value = val.sId??"";
                controller.getData();
              },
              bottomMargin: 3.h,
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
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2.5),
                3: FlexColumnWidth(1.8),
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
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 5),
                        child: Text("CLASS ROOM",textAlign: TextAlign.center, style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w900)),
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
            Obx(() => Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder(
                  horizontalInside: BorderSide(color: Color(0xFFEBEBEB)),
                  verticalInside: BorderSide(color: Color(0xFFEBEBEB)),
                ),
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(2.5),
                  3: FlexColumnWidth(1.8),
                },
                children: List.generate(
                  controller.list?.length??0, (index) => TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 5),
                          child: Text(formatBackendDate(controller.list?[index]?.date??""), textAlign: TextAlign.center, style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w400),),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 5),
                          child: Text("${getFormattedTime(controller.list?[index]?.startTime??"")} - ${getFormattedTime(controller.list?[index]?.endTime??"")}", textAlign: TextAlign.center, style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w400),),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 5),
                          child: Text(controller.list?[index]?.subject?.name??"", textAlign: TextAlign.center, style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w400),),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 5),
                          child: Text(controller.list?[index]?.classRoomNo.toString()??"", textAlign: TextAlign.center, style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ]
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
