import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({Key? key}) : super(key: key);

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends State<AudioCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: BaseColors.backgroundColor,
          border: Border(top: BorderSide(color: BaseColors.primaryColor))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: BaseColors.primaryColor),
                  color: Color(0xffF8F4E9)
                ),
                child: SvgPicture.asset("assets/images/sound 1.svg"),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: BaseColors.primaryColor),
                  color: Color(0xffF8F4E9)
                ),
                child: SvgPicture.asset("assets/images/mute_img.svg"),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: BaseColors.primaryColor
                ),
                child: Icon(
                  CupertinoIcons.phone_down_fill,
                  color: BaseColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: BaseColors.primaryColor)
              ),
              child: SvgPicture.asset(manSvg, height: 60,),
            ),
            SizedBox(
              height: 2.h,
            ),
            addText("Rahim Khan", 20.sp, BaseColors.primaryColor, FontWeight.w700),
            SizedBox(
              height: .8.h,
            ),
            addText("Meeting Ends on 05:12", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
          ],
        ),
      ),
    );
  }
}
