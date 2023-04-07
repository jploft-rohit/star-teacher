import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Rahim Khan", style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: BaseColors.primaryColor),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          padding: EdgeInsets.zero,
          splashRadius: 1,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: BaseColors.backgroundColor,
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
                child: SvgPicture.asset(videoCallSvg)
              ),
              Container(
                height: 50.0,
                width: 50.0,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BaseColors.primaryColor
                ),
                child: SvgPicture.asset(audioCallSvg)
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: 100.w,
        decoration: BoxDecoration(
            border: Border.all(color: BaseColors.primaryColor)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(manSvg, height: 35.h,),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: BaseColors.primaryColor)
                  ),
                  child: SvgPicture.asset(manSvg, height: 10.h,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
