import 'package:flutter/material.dart';
// import 'package:staff_app/backend/responses_model/school_list_response.dart' as SchoolData;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen.dart';

class StarRewardScreen extends StatefulWidget {
  const StarRewardScreen({Key? key}) : super(key: key);

  @override
  State<StarRewardScreen> createState() => _StarRewardScreenState();
}

class _StarRewardScreenState extends State<StarRewardScreen> {

  TextEditingController searchCtrl = TextEditingController();
  RewardScreenCtrl controller = Get.put(RewardScreenCtrl());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).star_rewards),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Obx(()=>Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: ColorConstants.borderColor
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFilterDropDown(
                            hintText: controller.selectedSchoolName.value.isEmpty ? 'School' : controller.selectedSchoolName.value,
                            item: baseCtrl.schoolListData.data?.data?.map((SchoolData value){
                              return DropdownMenuItem<SchoolData>(
                                  value: value,
                                  child: addText(value.name??"", 16.sp, Colors.black, FontWeight.w400));
                            }).toList(),
                          onChange: (value) {
                            controller.selectedSchoolId.value = value?.sId??"";
                            controller.selectedSchoolName.value = value?.name??"";
                          // setState(() {});
                        },icon: classTakenSvg),
                        Container(
                          child: VerticalDivider(
                            width: 1,
                          ),
                          height: 35,
                          width: 1,
                        ),
                        CustomFilterDropDown(
                          initialValue: DummyLists.initialGrade, hintText: 'Grade 3',
                          listData: DummyLists.gradeData, onChange: (value) {
                          setState(() {
                            DummyLists.initialGrade=value;
                          });
                         },icon: classTakenSvg
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFilterDropDown(
                          initialValue: DummyLists.initialClass, hintText: 'H1',
                          listData: DummyLists.classData, onChange: (value) {
                          setState(() {
                            DummyLists.initialClass=value;
                          });
                        },icon: classTakenSvg),
                        Container(child: VerticalDivider(width: 1,),height: 4.h,width: 1,),
                        CustomFilterDropDown(
                          initialValue: DummyLists.initialTerm, hintText: 'Term 1',
                          listData: DummyLists.termData, onChange: (value) {
                          setState(() {
                            DummyLists.initialTerm=value;
                          });
                        },icon: classTakenSvg,),
                      ],
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    FilterTextFormField(onChange: (String val) {
                    }, hintText: "Search Star,ID...", keyBoardType: TextInputType.name,
                    ),
                  ],
                ),
              )),
            SizedBox(height: 2.h),
            Obx(()=>(baseCtrl.starsList?.length??0) == 0
                ? BaseNoData(message: "No Stars Found",topMargin: 28.h,)
                : ListView.builder(
                itemCount: baseCtrl.starsList?.length??0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      if (controller.selectedSchoolId.value.isNotEmpty) {
                        controller.selectedStarId.value = baseCtrl.starsList?[index].user?.sId??"";
                        controller.getRewards();
                        Get.to(RewardsScreen());
                      }else{
                        baseToast(message: "Please first select school");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: BaseColors.borderColor
                            )
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 6.h,
                              width: 6.h,
                              padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 10.sp, right: 10.sp),
                              decoration: BoxDecoration(
                                border: Border.all(color: BaseColors.primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: BaseImageNetwork(link: baseCtrl.starsList?[index].user?.profilePic??"",concatBaseUrl: false,height: 3.h,width: 3.h,),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText(toBeginningOfSentenceCase(baseCtrl.starsList?[index].user?.name??"N/A")??"N/A", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    children: [
                                      addText("ID: ", 14.sp, BaseColors.textBlackColor, FontWeight.w700),
                                      addText("#${baseCtrl.starsList?[index].studentId??"N/A"}", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
