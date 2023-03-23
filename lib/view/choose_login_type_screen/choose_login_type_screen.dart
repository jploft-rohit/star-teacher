import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';

class ChooseLoginTypeScreen extends StatefulWidget {
  const ChooseLoginTypeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLoginTypeScreen> createState() => _ChooseLoginTypeScreenState();
}

class _ChooseLoginTypeScreenState extends State<ChooseLoginTypeScreen> {
  var roleImagesList = [
    'assets/images/teacher_img.svg',
    'assets/images/admin_img.svg',
    'assets/images/driver_img.svg',
    'assets/images/security_img.svg',
    'assets/images/shop_ig.svg',
    'assets/images/nurse_img.svg',
  ];

  var roleNameList = ['Teacher','Admin','Driver/Supervisor','School Security','Shop','Nurse'];
  int selectedPos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Center(
                child: Text(translate(context).login_as, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 21.sp),),
              )),
          Flexible(
              flex: 12,
              child: Container(
                padding: EdgeInsets.only(top: 4.h, left: 7.w, right: 7.w),
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: CustomColors.white,
                    boxShadow: [getBoxShadow()]),
                child: Column(
                  children: [
                    Expanded(child: buildGrids()),
                    BaseButton(title: translate(context).next_btn_txt, onPressed: () {Get.offAllNamed(dashboardScreenRoute);},btnWidth: Get.width * 30 /100,),
                    const SizedBox(height: 20,),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget buildGrids(){
    return GridView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          selectedPos = index;
          setState(() {});
        },
        child: buildItem(index),
      ),
      itemCount: roleNameList.length,
    );
  }


  Widget buildItem(int index){
    return Container(
      width: 38.w,
      margin:  EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
          color: selectedPos == index ? CustomColors.backgroundColor : CustomColors.white,
          boxShadow: [getBoxShadow()],
          border: selectedPos == index ? Border.all(color: CustomColors.primaryColor,width: 1.5) : null,
          borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [

            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: true,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedPos == index ? CustomColors.primaryColor : CustomColors.textLightGreyColor,
                        boxShadow: [getBoxShadow()],
                        border: Border.all(color: CustomColors.white,width: 2)
                    ),child: const Icon(Icons.check,color: CustomColors.white,size: 15,),
                  ),
                )),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(roleImagesList[index]),
                  SizedBox(height: 2.h,),
                  Text(roleNameList[index], style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
