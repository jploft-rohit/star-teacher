import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/rating_screens/rating_screen_ctrl.dart';

class DriverRatingScreen extends StatefulWidget {
  String title;
  DriverRatingScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<DriverRatingScreen> createState() => _DriverRatingScreenState();
}

class _DriverRatingScreenState extends State<DriverRatingScreen> {
  RatingScreenCtrl ctrl = Get.put(RatingScreenCtrl());

  TextEditingController commentCtrl = TextEditingController();
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
            CustomDropDown(initialValue: selectUserType,
                hintText: widget.title=="Driver"?"Select Driver":
                widget.title=="Bus"?"Select Bus":"Select Supervisor",
                listData: widget.title=="Bus"?[
                  "#29789","#29739","#29289","#29729",
                ]:[
                  "Nazme Suheil","Salim Khan","Shahrukh Khan",],
                topPadding: 5,
                bottomPadding: 5,
                onChange: (value){
                  setState(() {
                    selectUserType=value;
                  });

                }, icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 24,)),
            SizedBox(height: 2.h,),
            Container(
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
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
                    child: SvgPicture.asset(widget.title == "Staff"
                        ? manSvg
                        : widget.title != "Bus"
                            ? "assets/images/chauffeur 1.svg"
                            : "assets/images/Group 7642.svg"),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.title == "Driver" || widget.title == "Supervisor") ...[
                          buildInfoItems(translate(context).name, "Rahish"),
                          SizedBox(
                            height: .5.h,
                          ),
                          buildInfoItems(
                              translate(context).designation, "Bus Driver"),
                        ] else if (widget.title == "Staff") ...[
                          buildInfoItems(translate(context).name, "Rahish"),
                          SizedBox(
                            height: .5.h,
                          ),
                          buildInfoItems(
                              translate(context).designation, "Head Master"),
                        ] else ...[
                          buildInfoItems(translate(context).bus_id, "#29735"),
                          SizedBox(
                            height: .5.h,
                          ),
                          buildInfoItems(
                              translate(context).bus_plate, "569815"),
                          SizedBox(
                            height: .5.h,
                          ),
                          buildInfoItems(
                              translate(context).school_id, "#s23443"),
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
              initialRating: 4,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 22.sp,
              minRating: 1,
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
                print(rating);
                ctrl.totalRating.value = rating;
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(() {
              return ctrl.totalRating.value < 3.0
                  ? addText(
                      translate(context)
                          .note_Comment_is_mandatory_if_you_rate_minimum,
                      13.sp,
                      BaseColors.textLightGreyColor,
                      FontWeight.w400)
                  : const SizedBox();
            }),
            SizedBox(
              height: 2.h,
            ),
            BaseTextFormField(
              controller: commentCtrl,
              hintText: "${translate(context).comment} : ",
              maxLine: 4,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    checkColor: BaseColors.primaryColor,
                    activeColor: Colors.transparent,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: ctrl.isChecked.value,
                    visualDensity: const VisualDensity(horizontal: -4),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                          width: 1.0, color: BaseColors.primaryColor),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                        side: const BorderSide(color: BaseColors.primaryColor)),
                    onChanged: (bool? value) {
                      ctrl.isChecked.value = value!;
                    },
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
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
                  BaseOverlays().showConfirmationDialog(
                      title: "Are you sure you want to send this feedback?");
                }),
          ],
        ),
      ),
    );
  }
}
