import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/route_destination/controller/route_controller.dart';
import 'package:staff_app/view/route_destination/route_description_view.dart';

import '../../utility/sizes.dart';

class RouteView extends GetView<RouteController> {
  const RouteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<RouteController>(
      () => RouteController(),
    );
    return Scaffold(
      appBar: BaseAppBar(title: "Route"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseDropDown(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return card(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget card(index) {
    return GestureDetector(
      onTap: () {
        Get.to(RouteDescriptionView());
      },
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(bottom: 1.5.h),
        width: 100.w,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0,0)
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText(
                    'Route No. ${index + 1}',
                    16,
                    Colors.black,
                    FontWeight.w700,
                  ),
                  SizedBox(height: 5),
                  buildDetailRow('Start Destination : ', 'Hypermarket'),
                  buildDetailRow('End Destination : ', 'UAE School'),
                  buildDetailRow('Stoppage : ', '11'),
                  buildDetailRow('Bus ID : ', '#245651'),
                  buildDetailRow('Driver : ', 'Rafiq Khan'),
                  buildDetailRow('Supervisor : ', 'Salma Khan'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                "assets/images/map_ig.svg",
                width: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(title, body) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText(title, detailLabelTs, BaseColors.primaryColor, FontWeight.w900),
            Expanded(
              child: addText(
                  body, detailValueTs, Colors.black, FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
