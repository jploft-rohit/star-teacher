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
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/submit_assignment_popup.dart';

class StartPendingAssignment extends StatefulWidget {
  const StartPendingAssignment({Key? key}) : super(key: key);

  @override
  State<StartPendingAssignment> createState() => _StartPendingAssignmentState();
}

class _StartPendingAssignmentState extends State<StartPendingAssignment> {
  int selectedFMOPos = -1;
  PageController controller = PageController();
  AssignmentScreenCtrl ctrl = Get.find<AssignmentScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, "Assignment", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: PageView.builder(
          itemCount: ctrl.pendingAssignmentList.length,
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, pageIndex) {
            return SingleChildScrollView(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Question: ',
                          style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),
                          children: <TextSpan>[
                            TextSpan(text: "${pageIndex + 1}", style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp)),
                            TextSpan(text: "/${ctrl.pendingAssignmentList.length}", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Mark: ',
                          style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),
                          children: <TextSpan>[
                            TextSpan(text: "3", style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  if(pageIndex == 1 || pageIndex == 3)
                    Container(
                      height: 200,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/Rectangle 446.png"),
                          Center(
                            child: Container(
                              height: 200.0,
                              width: Get.width,
                              color: Colors.black.withOpacity(0.5),
                              child: SvgPicture.asset("assets/images/play_img.svg", fit: BoxFit.scaleDown,),
                            ),
                          )
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(soundOnImg),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        child: Text("${ctrl.pendingAssignmentList[pageIndex]['question']}",
                          style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: CustomColors.primaryColor, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                    ListView.builder(
                      itemCount: ctrl.pendingAssignmentList[pageIndex]['ans'].length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            selectedFMOPos = index;
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.sp),
                            margin: EdgeInsets.only(bottom: 10.0,left: 5.0,right: 5.0),
                            decoration: BoxDecoration(
                                color: selectedFMOPos == index ? CustomColors.backgroundColor : CustomColors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: selectedFMOPos == index ? CustomColors.primaryColor :CustomColors.borderColor),
                                boxShadow: [getBoxShadow()]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(child: addText("${ctrl.pendingAssignmentList[pageIndex]['ans'][index]}", 17.sp, selectedFMOPos == index ? CustomColors.primaryColor : CustomColors.textBlackColor, selectedFMOPos == index ? FontWeight.w700 : FontWeight.w400)),
                                Row(
                                  children: [
                                    SvgPicture.asset(soundOnImg, height: 18.sp,),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      // padding: const EdgeInsets.symmetric(horizontal: 9),
                                      decoration: BoxDecoration(
                                          color: selectedFMOPos == index
                                              ? CustomColors.backgroundColor
                                              : CustomColors.borderColor,
                                          boxShadow: [getLightBoxShadow()],
                                          border: Border.all(
                                              color: Colors.transparent, width: 1.5),
                                          borderRadius: BorderRadius.circular(30.0)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: CustomColors.white, width: 1.5),
                                            shape: BoxShape.circle,
                                            boxShadow: [getLightBoxShadow()],
                                            color: selectedFMOPos == index
                                                ? CustomColors.primaryColor
                                                : CustomColors.borderColor
                                        ),
                                        child: Center(
                                          child: Icon(Icons.check, color: CustomColors.white,
                                              size: 16.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  if(ctrl.pendingAssignmentList[pageIndex]['type'] == "write")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        addText("Input Number 1 to 10", 15.sp, CustomColors.textBlackColor, FontWeight.w400),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomTextField(controller: TextEditingController(), hintText: "0",borderRadius: 10.0,),
                      ],
                    ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomButton(text: ctrl.pendingAssignmentList.length -1 != pageIndex ? "NEXT" : "Submit", onPressed: (){
                    if(ctrl.pendingAssignmentList.length -1 != pageIndex){
                      print("object");
                      controller.animateToPage(pageIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    }else{
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return SubmitAssignmentPopup();
                        },
                      );
                    }
                  }),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
