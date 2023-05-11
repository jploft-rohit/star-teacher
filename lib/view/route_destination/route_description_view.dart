import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/custom_dropdown_widget.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/images_icon_path.dart';
import 'package:staff_app/utility/utility.dart';
import 'package:staff_app/view/route_destination/controller/route_description_controller.dart';

import '../../utility/sizes.dart';


class RouteDescriptionView extends StatefulWidget {
  const RouteDescriptionView({Key? key}) : super(key: key);

  @override
  State<RouteDescriptionView> createState() => _RouteDescriptionViewState();
}

class _RouteDescriptionViewState extends State<RouteDescriptionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: "Route Description"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: "Select School",
                listData: DummyLists.schoolData,
                onChange: (value) {
                  setState(() {
                    DummyLists.initialSchool = value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(
                  Icons.arrow_drop_down, color: Color(0xFFC4C4C4), size: 25,),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.topLeft,
                width: 100.w,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  color: BaseColors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: BaseColors.primaryColor),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 3)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addText(
                      'Start Destination',
                      16,
                      Colors.black,
                      FontWeight.w700,
                    ),
                    SizedBox(height: 20),
                    buildDetailRow(
                      icReport,
                      'Area : ',
                      'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite',
                    ),
                    buildDetailRow(
                      icReport,
                      'Sector : ',
                      'United Arab Emirates',
                    ),
                    buildDetailRow(
                      icMessage,
                      'Address : ',
                      'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite',
                      divider: false,
                    ),
                    SizedBox(height: 30),
                    addText(
                      'Add Stoppage',
                      16,
                      Colors.black,
                      FontWeight.w700,
                    ),
                    SizedBox(height: 20),
                    buildDetailRow(
                      icReport,
                      'Area : ',
                      'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite',
                    ),
                    buildDetailRow(
                      icReport,
                      'Sector : ',
                      'United Arab Emirates',
                    ),
                    buildDetailRow(
                      icMessage,
                      'Address : ',
                      'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite',
                      divider: false,
                    ),
                    SizedBox(height: 30),
                    addText(
                      'End Destination',
                      16,
                      Colors.black,
                      FontWeight.w700,
                    ),
                    SizedBox(height: 20),
                    buildDetailRow(
                      icReport,
                      'Area : ',
                      'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite',
                    ),
                    buildDetailRow(
                      icReport,
                      'Sector : ',
                      'United Arab Emirates',
                    ),
                    buildDetailRow(
                      icMessage,
                      'Address : ',
                      'hypermarket - Al Qusais, behind Stadium Metro Station - Dubai opossite',
                      divider: false,
                    ),
                    SizedBox(height: 30),
                    addText(
                      'Route Number',
                      16,
                      Colors.black,
                      FontWeight.w700,
                    ),
                    SizedBox(height: 20),
                    buildDetailRow(
                      icReport,
                      'Route Number : ',
                      '550',
                    ),
                    buildDetailRow(
                      "assets/images/bus_img.svg",
                      'Bus ID : ',
                      '#145254825',
                    ),
                    buildDetailRow(
                      "assets/images/chauffeur 1.svg",
                      'Driver : ',
                      'Rafiq Khan',
                    ),
                    buildDetailRow(
                      "assets/images/ic_supervisor.svg",
                      'Supervisor : ',
                      'Rafiq Khan',
                      divider: false,
                    ),
                  ],
                ),
              )
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
            SvgPicture.asset(icon,height: 16,width: 16),
            SizedBox(width: 5),
            addText(title, detailLabelTs, BaseColors.black, FontWeight.w400),
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
  Container mainDropDown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffCECECE),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // dropDownBuilder(
          //   prefixIcon: 'assets/images/select-star-prefix.svg',
          //   hint: ' School',
          //   items: [
          //     'School 1',
          //     'School 2',
          //     'School 3',
          //   ],
          //   onChanged: (value) {},
          // ),
          divider(height: 1),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Star,ID...',
              hintStyle: TextStyle(
                color: Color(0XFFB0B0B0),
                fontSize: 16,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SvgPicture.asset(
                  'assets/images/search-grey.svg',
                  height: 18,
                  width: 18,
                  fit: BoxFit.cover,
                ),
              ),
              border: InputBorder.none,
              prefixIconConstraints: BoxConstraints(
                  minHeight: 14, minWidth: 22, maxHeight: 30, maxWidth: 2302),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
  Container divider({double height = 10}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height),
      width: Get.width,
      height: 1,
      color: Color(0xffCECECE),
    );
  }
}