import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, "Location", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/mapimage.png",
                    fit: BoxFit.fill,
                    height: 75.h,
                    width: 100.w,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height :4.h),
              // CustomButton(
              //     child: addText(
              //         'Change Route'.toUpperCase(),
              //         getNormalTextFontSIze(),
              //         CustomColors.primaryColor,
              //         FontWeight.w500),
              //     onTap: () {
              //       Get.back();
              //     }),
              // spaceheight(4.h)
            ],
          ),
        ),
      ),
    );
  }
}
