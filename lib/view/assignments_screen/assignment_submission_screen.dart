import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';
import 'package:text_to_speech/text_to_speech.dart';

class AssignmentSubmissionScreen extends StatefulWidget {
  const AssignmentSubmissionScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentSubmissionScreen> createState() => _AssignmentSubmissionScreenState();
}

class _AssignmentSubmissionScreenState extends State<AssignmentSubmissionScreen> {
  int selectedFMOPos = -1;
  TextToSpeech tts = TextToSpeech();
  AssignmentScreenCtrl ctrl = Get.put(AssignmentScreenCtrl());
  PageController controller = PageController();
  Locale locale = const Locale('en');
  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).submission),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: PageView.builder(
          itemCount: ctrl.mcqList.length,
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, pageIndex) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if(pageIndex == 0)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: BaseColors.borderColor),
                    ),
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: BaseColors.primaryColor
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SvgPicture.asset(manSvg,height: 30,),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sania", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
                              SizedBox(
                                height: .2.h,
                              ),
                              Text("#562665", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                              SizedBox(
                                height: .2.h,
                              ),
                              Text("G3-H1", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '${translate(context).question}: ',
                          style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                          children: <TextSpan>[
                            TextSpan(text: "${pageIndex + 1}", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                            TextSpan(text: "/${ctrl.mcqList.length}", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '${translate(context).marks}: ',
                          style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                          children: <TextSpan>[
                            TextSpan(text: "3", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  if(pageIndex == 0 || pageIndex == 2)
                    Container(
                    height: 200,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Image.asset("assets/delete/Rectangle 446.png"),
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
                  if(pageIndex == 1)
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(left: 30.sp, right: 30.sp),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(color: BaseColors.primaryColor, width: 2.0)
                      ),
                    ),
                  if(ctrl.mcqList[pageIndex]['type'] == "download")
                    Image.asset("assets/images/car_img.png"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(soundOnImg),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () async {
                              await tts.speak(ctrl.mcqList[pageIndex]['question']);
                            },
                            child: Text("${ctrl.mcqList[pageIndex]['question']}",
                            style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: BaseColors.primaryColor, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  if(ctrl.mcqList[pageIndex]['type'] == "ans")
                    ListView.builder(
                    itemCount: ctrl.mcqList[pageIndex]['ans'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          selectedFMOPos = index;
                          await tts.speak(ctrl.mcqList[pageIndex]['ans'][index]);
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.sp),
                          margin: const EdgeInsets.only(bottom: 10.0,left: 5.0,right: 5.0),
                          decoration: BoxDecoration(
                            color: selectedFMOPos == index ? BaseColors.backgroundColor : BaseColors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: selectedFMOPos == index ? BaseColors.green :BaseColors.borderColor),
                            boxShadow: [getBoxShadow()]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              addText(ctrl.mcqList[pageIndex]['ans'][index], 16.sp, selectedFMOPos == index ? BaseColors.primaryColor : BaseColors.textBlackColor, selectedFMOPos == index ? FontWeight.w700 : FontWeight.w400),
                              Row(
                                children: [
                                  SvgPicture.asset(soundOnImg, height: 16.sp,),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos == index
                                            ? BaseColors.backgroundColor
                                            : Colors.transparent,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getLightBoxShadow()],
                                          color: selectedFMOPos == index
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
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
                  if(ctrl.mcqList[pageIndex]['type'] == "write")
                    CustomTextField(controller: TextEditingController(), hintText: translate(context).write_your_answer_here, maxLine: 3,fillColor: const Color(0xffF8F8F8),),
                  if(ctrl.mcqList[pageIndex]['type'] == "download")
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: "filename.jpeg",
                      fillColor: const Color(0xffF8F8F8),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: BaseColors.darkShadowColor,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 3)
                              )
                            ],
                            color: BaseColors.backgroundColor,
                            border: Border.all(color: BaseColors.primaryColor),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              addText(translate(context).download.toUpperCase(), 14.sp, BaseColors.primaryColor, FontWeight.w700),
                              SizedBox(
                                width: 1.w,
                              ),
                              SvgPicture.asset("assets/images/salary_slip_download_img.svg", height: 16.sp,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  if(ctrl.mcqList[pageIndex]['type'] == "audio")
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      margin: const EdgeInsets.only(bottom: 10.0,left: 5.0,right: 5.0),
                      decoration: BoxDecoration(
                          color: BaseColors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: BaseColors.borderColor),
                          boxShadow: [getBoxShadow()]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            color: BaseColors.primaryColor,
                          ),
                          SvgPicture.asset("assets/images/audio_wave_img.svg"),
                          const SizedBox.shrink()
                        ],
                      ),
                    ),
                  if(ctrl.mcqList[pageIndex]['type'] == "write" || ctrl.mcqList[pageIndex]['type'] == "download" || ctrl.mcqList[pageIndex]['type'] == "audio")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        addText(translate(context).correction, 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                        SizedBox(
                          height: 1.h,
                        ),
                        CustomTextField(controller: TextEditingController(), hintText: translate(context).suggest_corrections, maxLine: 3,),
                      ],
                    ),
                  if(ctrl.mcqList[pageIndex]['type'] == "write" || ctrl.mcqList[pageIndex]['type'] == "download" || ctrl.mcqList[pageIndex]['type'] == "audio")
                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addText("${translate(context).evaluate} :", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 30.0,
                            width: 35.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffFCFCFC),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: BaseColors.borderColor)
                            ),
                            child: addText("1", 15.sp, const Color(0xff7B8D9E), FontWeight.w400),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 30.0,
                            width: 35.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color(0xffFCFCFC),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: BaseColors.borderColor)
                            ),
                            child: addText("2", 15.sp, const Color(0xff7B8D9E), FontWeight.w400),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 30.0,
                            width: 35.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color(0xffFCFCFC),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: BaseColors.borderColor)
                            ),
                            child: addText("3", 15.sp, const Color(0xff7B8D9E), FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  BaseButton(title: ctrl.mcqList.length -1 != pageIndex ? translate(context).next_btn_txt : translate(context).finish.toUpperCase(), onPressed: (){
                    if(ctrl.mcqList.length -1 != pageIndex){
                      print("object");
                      controller.animateToPage(pageIndex + 1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    }else{
                      Get.back();
                    }
                  },btnType: largeButton,),
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

  Future<void> init() async {
    await getLocale().then((value) async {
      locale = value;
      await tts.setLanguage('en-US');
    });
  }
}
