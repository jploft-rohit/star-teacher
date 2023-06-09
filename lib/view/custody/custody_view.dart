import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/custody/custody_controller.dart';

import '../../utility/custom_text_field.dart';

class CustodyView extends GetView<CustodyController> {
  const CustodyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CustodyController>(
      () => CustodyController(),
    );
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: "Custody"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: BaseColors.borderColor
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                            child: Row(
                              children: [
                                SvgPicture.asset(classTakenSvg,height: 15,),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_drop_down,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 0.0,),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                            child: Row(
                              children: [
                                SvgPicture.asset(classTakenSvg,height: 15,),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Class", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_drop_down,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: BaseColors.borderColor,
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(classTakenSvg,height: 15,),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Grade", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_drop_down,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                width: 100.w,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  color: BaseColors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: BaseColors.white),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 3)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow(
                      icReport,
                      'Description : ',
                      'This is custody for the selected class grade that star must receive and shoud have',
                    ),
                    buildDetailRow(
                      "assets/images/ic_calendar_black.svg",
                      'Date of Allottment : ',
                      '01/03/2022',
                    ),
                    buildDetailRow(
                      "assets/images/user.svg",
                      'Stars Strength : ',
                      '125',
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText(
                          'Books',
                          14,
                          Colors.black,
                          FontWeight.w700,
                        ),
                        SizedBox(height: 5),
                        Divider(),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: addText('SUBJECT NAME', 11, Colors.black,
                                    FontWeight.w700),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: addText('ALLOTTED', 11, Colors.black,
                                    FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: addText('RECEIVED', 11, Colors.black,
                                  FontWeight.w700),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Color(0xffEBEBEB),
                        ),
                        Container(
                          color: Colors.white,
                          child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                // 1: FlexColumnWidth(2),
                              },
                              border: TableBorder.symmetric(
                                inside: BorderSide(
                                  color: Color(0xffEBEBEB),
                                  width: 1,
                                ),
                              ),
                              children: [
                                {
                                  'title': 'English',
                                  'quantity': '1',
                                  'price': '0',
                                },
                                {
                                  'title': 'Maths',
                                  'quantity': '2',
                                  'price': '1',
                                },
                                {
                                  'title': 'Islamic',
                                  'quantity': '1',
                                  'price': '1',
                                },
                                {
                                  'title': 'Science',
                                  'quantity': '3',
                                  'price': '2',
                                },
                                {
                                  'title': 'Social Study',
                                  'quantity': '2',
                                  'price': '1',
                                }
                              ]
                                  .map(
                                    (e) => TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: addText(
                                            e['title']!,
                                            13,
                                            BaseColors.black,
                                            FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: addTextCenter(
                                            e['quantity']!,
                                            13,
                                            BaseColors.black,
                                            FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: addTextCenter(
                                            e['price']!,
                                            13,
                                            BaseColors.black,
                                            FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList()),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Color(0xffEBEBEB),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText(
                          'Products',
                          14,
                          Colors.black,
                          FontWeight.w700,
                        ),
                        SizedBox(height: 5),
                        Divider(),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: addText(
                                    'NAME', 11, Colors.black, FontWeight.w700),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: addText('ALLOTTED', 11, Colors.black,
                                    FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: addText('RECEIVED', 11, Colors.black,
                                  FontWeight.w700),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Color(0xffEBEBEB),
                        ),
                        Container(
                          color: Colors.white,
                          child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                // 1: FlexColumnWidth(2),
                              },
                              border: TableBorder.symmetric(
                                inside: BorderSide(
                                  color: Color(0xffEBEBEB),
                                  width: 1,
                                ),
                              ),
                              children: [
                                {
                                  'title': 'Laptop',
                                  'quantity': '1',
                                  'price': '0',
                                },
                                {
                                  'title': 'Bag',
                                  'quantity': '1',
                                  'price': '1',
                                },
                              ]
                                  .map(
                                    (e) => TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: addText(
                                            e['title']!,
                                            13,
                                            BaseColors.black,
                                            FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: addTextCenter(
                                            e['quantity']!,
                                            13,
                                            BaseColors.black,
                                            FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: addTextCenter(
                                            e['price']!,
                                            13,
                                            BaseColors.black,
                                            FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList()),
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          color: Color(0xffEBEBEB),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildDetailRow(icon, title, body, {bool divider = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon,color: BaseColors.primaryColor),
            SizedBox(width: 10),
            addText(
              title,
              detailLabelTs,
              BaseColors.black,
              FontWeight.w400,
            ),
            Expanded(
              child: addText(body, detailValueTs, BaseColors.primaryColor,
                  FontWeight.w700),
            ),
          ],
        ),
        divider ? Divider() : Container(),
      ],
    );
  }

  Text addTextCenter(
      String text, double size, Color color, FontWeight fontWeight) {
    return Text(text.tr,
        textScaleFactor: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: fontWeight,
            fontFamily: 'Arial'));
  }
}
