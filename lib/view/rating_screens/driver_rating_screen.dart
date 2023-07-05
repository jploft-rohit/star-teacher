import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/rating_screens/rating_screen_ctrl.dart';
import 'package:staff_app/view/transportation_screen/controller/transportation_screen_ctrl.dart';

class RatingScreen extends StatefulWidget {
  final String title;
  RatingScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  TransportationScreenCtrl controller = Get.find<TransportationScreenCtrl>();
  RatingScreenCtrl ctrl = Get.put(RatingScreenCtrl());

  String? selectUserType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "${widget.title} Rating"),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            // BaseDropDown(title: widget.title == "Bus" ? "Bus ID : #29735" : "Name : Rahish"),
            // CustomDropDown(initialValue: selectUserType,
            //     hintText: widget.title=="Driver"?"Select Driver":
            //     widget.title=="Bus"?"Select Bus":"Select Supervisor",
            //     listData: widget.title=="Bus"?[
            //       "#29789","#29739","#29289","#29729",
            //     ]:[
            //       "Nazme Suheil","Salim Khan","Shahrukh Khan",],
            //     topPadding: 5,
            //     bottomPadding: 5,
            //     onChange: (value){
            //       setState(() {
            //         selectUserType=value;
            //       });
            //
            //     }, icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 24,)),
            // SizedBox(height: 2.h),
            Container(
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: BaseColors.borderColor)),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(left: 13.sp, right: 13.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.primaryColor),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: BaseImageNetwork(
                      link: widget.title == "Driver" ? controller.tripData.value.driverUser?.profilePic??"" : widget.title == "Supervisor" ? controller.tripData.value.supervisorUser?.profilePic??"" : controller.tripData.value.bus?.image??"",
                      errorWidget: SvgPicture.asset(widget.title == "Staff"
                          ? manSvg
                          : widget.title != "Bus"
                          ? "assets/images/chauffeur 1.svg"
                          : "assets/images/Group 7642.svg",
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Drive
                        if (widget.title == "Driver") ...[
                          buildInfoItems(translate(context).name, controller.tripData.value.driverUser?.name??"N/A"),
                          SizedBox(height: .5.h),
                          buildInfoItems(translate(context).designation, "Bus Driver"),
                        ]
                        /// Supervisor
                        else if (widget.title == "Supervisor") ...[
                          buildInfoItems(translate(context).name, controller.tripData.value.supervisorUser?.name??"N/A"),
                          SizedBox(height: .5.h),
                          buildInfoItems(translate(context).designation, "Supervisor"),
                        ]
                        /// Bus
                        else ...[
                          buildInfoItems(translate(context).bus_id, "#${controller.tripData.value.bus?.school?.schoolId.toString()??"N/A"}"),
                          SizedBox(height: .5.h),
                          buildInfoItems(translate(context).bus_plate, controller.tripData.value.bus?.plateNo.toString()??""),
                          SizedBox(height: .5.h),
                          buildInfoItems(translate(context).school_id, "#${controller.tripData.value.bus?.school?.schoolId.toString()??"N/A"}"),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            RatingBar(
              initialRating: controller.selectedRating.value,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 22.sp,
              minRating: 1,
              maxRating: 5,
              ratingWidget: RatingWidget(
                full: const Icon(
                  CupertinoIcons.star_fill,
                  color: BaseColors.primaryColor,
                ),
                half: SvgPicture.asset('assets/images/full_rating_img.svg'),
                empty: const Icon(
                  CupertinoIcons.star_fill,
                  color: BaseColors.borderColor,
                ),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                controller.selectedRating.value = rating;
              },
            ),
            SizedBox(height: 2.h),
            Obx(() {
              return controller.selectedRating.value < 3.0
                  ? addText(
                      translate(context).note_Comment_is_mandatory_if_you_rate_minimum,
                      13.sp,
                      BaseColors.textLightGreyColor,
                      FontWeight.w400)
                  : const SizedBox();
            }),
            SizedBox(
              height: 2.h,
            ),
            Obx(()=>Form(
                key: controller.formKey,
                child: BaseTextFormField(
                  controller: controller.commentCtrl.value,
                  hintText: "${translate(context).comment} : ",
                  maxLine: 4,
                  validator: (val){
                    if (controller.selectedRating.value < 3.0) {
                      if(controller.commentCtrl.value.text.trim().isEmpty){
                        return "Please Enter Comment";
                      }
                      return null;
                    }else{
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    checkColor: BaseColors.primaryColor,
                    activeColor: Colors.transparent,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: controller.isAnonymous.value,
                    visualDensity: const VisualDensity(horizontal: -4),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                          width: 1.0, color: BaseColors.primaryColor),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                        side: const BorderSide(color: BaseColors.primaryColor)),
                    onChanged: (value) {
                      controller.isAnonymous.value = value ?? false;
                    },
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    translate(context).do_you_want_to_remain_anonymous,
                    style: Style.montserratMediumStyle().copyWith(
                        color: BaseColors.textBlackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            BaseButton(
                btnType: largeButton,
                borderRadius: 20,
                title: translate(context).submit_btn_txt.toUpperCase(),
                onPressed: () {
                  if (controller.selectedRating.value < 3.0) {
                    if (controller.formKey.currentState?.validate()??false) {
                        controller.rateBus();
                    }
                  }else{
                    BaseOverlays().showConfirmationDialog(
                        title: "Are you sure you want to send this feedback?",
                        onRightButtonPressed: (){
                          controller.rateBus();
                        }
                    );
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
