import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
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
      appBar: appBarWithAction(context, "Waiting Area", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
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
                                          color: CustomColors.primaryColor
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: SvgPicture.asset(manSvg),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text("Najma Suheil", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Text("Called from Gate 3", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 13.sp),),
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
                      color: pageIndex == index ? CustomColors.primaryColor : CustomColors.borderColor,
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
                    style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),
                    children: <TextSpan>[
                      TextSpan(text: "Gate 6", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp, height: 1.2)),
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
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: CustomColors.primaryColor,
                  ),
                  boxShadow: [
                    getBoxShadow(),
                  ]
                ),
                child: Column(
                  children: [
                    Text("10/15", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 21.sp),),
                    SizedBox(
                      height: .5.h,
                    ),
                    Text("Remaining for Detaching", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
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
                  borderColor: CustomColors.borderColor,
                  controller: searchCtrl,
                  hintTextColor: CustomColors.textLightGreyColor,
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
                      child: InkWell(
                        onTap: (){
                          index = 0;
                          setState(() {});
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: index == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                              border: Border.all(
                                  color: index == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(index == 0)
                                  const BoxShadow(
                                      color: CustomColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text("Remaining", style: Style.montserratBoldStyle().copyWith(color: index == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          index = 1;
                          setState(() {});
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: index == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                              border: Border.all(
                                  color: index == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(index == 1)
                                  const BoxShadow(
                                      color: CustomColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text("Stamped", style: Style.montserratBoldStyle().copyWith(color: index == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                        child: InkWell(
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
                                        color: CustomColors.primaryColor
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
                                        Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Text("#632541", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
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
                                  color: CustomColors.borderColor,
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
                                          color: CustomColors.primaryColor,
                                          size: 15.0,
                                        ),
                                        Text("Gate No.: ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 13.sp),),
                                        Text("6", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 13.sp),),
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
                        child: InkWell(
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
                                    color: CustomColors.borderColor
                                )
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CustomColors.primaryColor
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
                                        Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Text("#632541", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
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
                                  color: CustomColors.borderColor,
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
                                          color: CustomColors.primaryColor,
                                          size: 15.0,
                                        ),
                                        Text("Gate No.: ", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 13.sp),),
                                        Text("6", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 13.sp),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomButton(
                                      text: "CHANGE STATUS",
                                      onPressed: (){},
                                      btnHeight: 20.0,
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
