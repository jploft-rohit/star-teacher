import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/wating_area_screen/star_called_popup.dart';
import 'package:staff_app/view/wating_area_screen/star_detaching_popup.dart';

class WaitingAreaScreen extends StatefulWidget {
  const WaitingAreaScreen({Key? key}) : super(key: key);

  @override
  State<WaitingAreaScreen> createState() => _WaitingAreaScreenState();
}

class _WaitingAreaScreenState extends State<WaitingAreaScreen> {
  int pageIndex = 0;

  TextEditingController searchCtrl = TextEditingController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Waiting Area"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.h,
                child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (index){
                    pageIndex = index;
                    setState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(3, (index) => Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp, left: 15.sp, right: 15.sp),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffFF5D5D)
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: BaseColors.primaryColor
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SvgPicture.asset(manSvg),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text("Najma Suheil", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Text("Called from Gate 3", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 13.sp),),
                                ],
                              ),
                            ),
                          ),),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.only(top:15.sp, left: 7.sp, right: 7.sp,),
                  decoration: BoxDecoration(
                      color: pageIndex == index ? BaseColors.primaryColor : BaseColors.borderColor,
                      shape: BoxShape.circle
                  ),
                ),),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10.0),
                child: RichText(
                  text: TextSpan(
                    text: 'Allocated Gate No. : ',
                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Gate 6", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.only(left: 10, right: 10.0),
                padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
                decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: BaseColors.primaryColor,
                  ),
                  boxShadow: [
                    getBoxShadow(),
                  ]
                ),
                child: Column(
                  children: [
                    Text("10/15", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 21.sp),),
                    SizedBox(
                      height: .5.h,
                    ),
                    Text("Remaining for Detaching", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10.0),
                child: CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SvgPicture.asset(searchSvg, color: Colors.grey[500], height: 14.0,),
                  ),
                  borderRadius: 15.0,
                  borderColor: BaseColors.borderColor,
                  controller: searchCtrl,
                  hintTextColor: BaseColors.textLightGreyColor,
                  hintText: "Search By ID...",
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          index = 0;
                          setState(() {});
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: index == 0 ? BaseColors.backgroundColor : BaseColors.screenBackgroundColor,
                              border: Border.all(
                                  color: index == 0 ? Colors.transparent : BaseColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(index == 0)
                                  const BoxShadow(
                                      color: BaseColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text("Remaining", style: Style.montserratBoldStyle().copyWith(color: index == 0 ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          index = 1;
                          setState(() {});
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: index == 1 ? BaseColors.backgroundColor : BaseColors.screenBackgroundColor,
                              border: Border.all(
                                  color: index == 1 ? Colors.transparent : BaseColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(index == 1)
                                  const BoxShadow(
                                      color: BaseColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text("Stamped", style: Style.montserratBoldStyle().copyWith(color: index == 1 ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              if(index == 0) ...[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10.0),
                  child: ListView.builder(
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: GestureDetector(
                          onTap: (){
                            showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                              return StarCalledPopup();
                            },);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color: Colors.green
                                )
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: BaseColors.primaryColor
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SvgPicture.asset(manSvg),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Text("#632541", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: BaseColors.borderColor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildInfoItems("Status", "Called for Pickup"),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color: BaseColors.primaryColor,
                                          size: 15.0,
                                        ),
                                        Text("Gate No.: ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 13.sp),),
                                        Text("6", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 13.sp),),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]else ...[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10.0),
                  child: ListView.builder(
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: GestureDetector(
                          onTap: (){
                            showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                              return StarDetachingPopup();
                            },);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color: BaseColors.borderColor
                                )
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: BaseColors.primaryColor
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SvgPicture.asset(manSvg),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Text("#632541", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: BaseColors.borderColor,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildInfoItems("Status", "Called for Pickup"),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_sharp,
                                          color: BaseColors.primaryColor,
                                          size: 15.0,
                                        ),
                                        Text("Gate No.: ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 13.sp),),
                                        Text("6", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 13.sp),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    BaseButton(
                                      btnType: dialogButton,
                                      title: "CHANGE STATUS",
                                      onPressed: (){},
                                      btnWidth: 105.0,
                                      textSize: 14.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
