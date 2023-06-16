import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_switch.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/cards_and_tags_screen/request_nfc_card_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/success_dialog_screen.dart';

class CardsAndTagsScreen extends StatefulWidget {
  const CardsAndTagsScreen({Key? key}) : super(key: key);

  @override
  State<CardsAndTagsScreen> createState() => _CardsAndTagsScreenState();
}

class _CardsAndTagsScreenState extends State<CardsAndTagsScreen> {
  bool isCardEnable = true;
  bool isTagEnable = false;
  final List<String> pendingMeetingdates = ['July 2, 8:30PM', '', '', ''];

  final List<String> heading = [
    'Request\nRaised',
    'Request\nAccepted',
    'Card\nIssued',
    'Received'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).card_tags),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: BaseColors.borderColor
                  )
                ),
                child: ListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp, bottom: 10.sp),
                  leading: Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SvgPicture.asset(manSvg),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems(translate(context).name, "Rahish"),
                      const SizedBox(
                        height: 2.0,
                      ),
                      buildInfoItems(translate(context).id, "#78656"),
                      const SizedBox(
                        height: 2.0,
                      ),
                      buildInfoItems(translate(context).designation, "Head Master"),
                      const SizedBox(
                        height: 2.0,
                      ),
                      buildInfoItems(translate(context).subject, "Maths"),
                      const SizedBox(
                        height: 2.0,
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: (){
                      showScanQrDialogue(context, false);
                    },
                      child: SvgPicture.asset(qrCodeSvg)),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text("${translate(context).select_options} : ", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
              SizedBox(
                height: 1.h,
              ),
              BaseButton(title: translate(context).request_cards_tags, onPressed: (){
                Get.to(const RequestNFCCardScreen());
              },btnType: "iconButton"),
              SizedBox(height: 1.h,),
              BaseButton(title: translate(context).synchronize_nfc_to_cards_tags, onPressed: (){
                showNFCDialog(context,"");
              },btnType: "iconButton"),
              SizedBox(
                height: 2.h,
              ),
              Text("${translate(context).linked_card_tag} :", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
              SizedBox(
                height: 1.h,
              ),
              buildCardTile(translate(context).card_No, "4587  9857  4587  6521", isCardEnable, (bool value) {
                print(value);
                isCardEnable = value;
                setState(() {});
                if(isCardEnable){
                  showGeneralDialog(
                    context: context,
                    pageBuilder:  (context, animation, secondaryAnimation) {
                      return SuccessDialogScreen(msg: "New Card/Tags Activated");
                    },
                  );
                }
              },),
              SizedBox(
                height: .5.h,
              ),
              buildCardTile(translate(context).tag_No, "4587", isTagEnable, (bool value) {
                print(value);
                isTagEnable = value;
                setState(() {});
                if(isTagEnable){
                  showGeneralDialog(
                    context: context,
                    pageBuilder:  (context, animation, secondaryAnimation) {
                      return SuccessDialogScreen(msg: "New Card/Tags Activated");
                    },
                  );
                }
              },),
              SizedBox(
                height: 1.h,
              ),
              Text("${translate(context).requests} : ", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      padding: EdgeInsets.all(15.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                              color: BaseColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/Layer_1.svg", height: 2.h),
                              SizedBox(
                                width: 2.w,
                              ),
                              buildInfoItems(translate(context).deactivation_card_no, "4587  9857  4587  6521"),
                            ],
                          ),
                          Divider(
                            color: BaseColors.borderColor,
                            thickness: 1.0,
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/report.svg",height: 2.1.h),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("${translate(context).reason} : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                              Flexible(child: Text("Lorem Ipsum is simply dummy text", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),maxLines: 1, overflow: TextOverflow.ellipsis,)),
                            ],
                          ),
                          Divider(
                            color: BaseColors.borderColor,
                            thickness: 1.0,
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset("assets/images/Vector (1).svg",height: 2.h),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("01/03/2022", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),)
                                  ],
                                ),
                              ),
                              Container(
                                height: 3.h,
                                width: 1.0,
                                color: BaseColors.borderColor,
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset("assets/images/time_icon.svg",height: 2.h),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("09:13pm", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                           Divider(
                            color: BaseColors.borderColor,
                            thickness: 1.0,
                            height: 3.h,
                          ),
                          StepProgressView(
                            width: MediaQuery.of(context).size.width,
                            curStep: 1,
                            color: BaseColors.primaryColor,
                            titles: pendingMeetingdates,
                            statuses: heading,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: BaseColors.primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
          Icon(
            Icons.arrow_forward,
            color: BaseColors.primaryColor,
            size: 20.sp,
          )
        ],
      ),
    );
  }
  Widget buildCardTile(String title, String heading, isEnable ,Function(bool) onChanged){
     return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: BaseColors.white,
          boxShadow: [
            getBoxShadow()
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset("assets/images/Layer_1.svg",height: 2.h),
          SizedBox(
            width: 1.w,
          ),
          buildInfoItems(title, heading),
          const Spacer(),
          Row(
            children: [
              Text("Off", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),),
              SizedBox(
                width: 1.w,
              ),
              BaseSwitch(
                key: GlobalKey(),
                value: isEnable,
                enableColor: BaseColors.backgroundColor,
                enableSwitchColor: BaseColors.primaryColor,
                disableColor: BaseColors.textLightGreyColor,
                width: 35,
                height: 20,
                switchHeight: 20,
                switchWidth: 15,
                onChanged: onChanged,
              ),
              SizedBox(
                width: 1.w,
              ),
              Text("On", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),),
            ],
          )
        ],
      ),
    );
  }
}
