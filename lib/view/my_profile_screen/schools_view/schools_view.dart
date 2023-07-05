import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/images_icon_path.dart';
import 'package:staff_app/view/map_screen.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';

class SchoolsView extends StatefulWidget {
  const SchoolsView({Key? key}) : super(key: key);

  @override
  State<SchoolsView> createState() => _SchoolsViewState();
}

class _SchoolsViewState extends State<SchoolsView> {
  final String na = translate(Get.context!).na;
  MyProfileCtrl controller = Get.find<MyProfileCtrl>();
  List<String> list = [
    "1. Ignite Group School",
    "2. UAE Public School",
    "3. Oman Public School",
  ];
  double bottomMargin = 1.h;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SingleChildScrollView(
        child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${translate(context).list_of_located_schools} : ', style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp)),
                  Text((controller.response.value.data?.schoolStaff?.length??0).toString(), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                itemCount: controller.response.value.data?.schoolStaff?.length??0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: buildJobDetails(context,index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildJobDetails(BuildContext context,index){
    // controller.response.value.data?.schoolStaff?[index].school?.staffsubjects?.classSection?.forEach((element) {
    //   controller.response.value.data?.placesOfClass = ","+(element.roomNo??"");
    // });
    // print("placesOfClass :-");
    // print(controller.response.value.data?.placesOfClass??"");
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: BaseColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: BaseColors.primaryColor,
              collapsedIconColor: BaseColors.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: Text(controller.response.value.data?.schoolStaff?[index].school?.name??na, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp)),
              backgroundColor: BaseColors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseDetailData(detailsLabel: translate(context).school_name, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.name??na),
                BaseDetailData(detailsLabel: translate(context).staff_admin, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.user?.name??na,),
                BaseDetailData(detailsLabel: translate(context).school_category, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.schoolCategory?.name??na,),
                BaseDetailData(detailsLabel: translate(context).school_type, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.schoolType?.name??na,),
                BaseDetailData(detailsLabel: translate(context).school_id, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.sId??na,),
                BaseDetailData(detailsLabel: translate(context).school_address, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.address??na,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseDetailData(detailsLabel: translate(context).school_sector, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.schoolSector?.name??na),
                    GestureDetector(
                        onTap: (){
                          Get.to(MapScreen());
                        },
                      child: SvgPicture.asset("assets/images/map_ig.svg"),
                    ),
                  ],
                ),
                // BaseDetailData(detailsLabel: translate(context).school_sector, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.schoolSector?.name??na,suffixIcon: "assets/images/map_ig.svg",spacedSuffix: true,),
                BaseDetailData(detailsLabel: translate(context).school_area, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.schoolArea?.name??na,),
                BaseDetailData(detailsLabel: translate(context).school_email, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.email??na,),
                BaseDetailData(detailsLabel: translate(context).school_contact_no, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.user?.mobile??na, suffixIcon: icCopy,),
                BaseDetailData(detailsLabel: translate(context).school_website, detailsValue: controller.response.value.data?.schoolStaff?[index].school?.website??na),
                buildTile(translate(context).week_days_3, controller.response.value.data?.schoolStaff?[index].weekDays??na, "assets/images/Vector (1).svg"),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).number_of_classes_per_week, controller.response.value.data?.schoolStaff?[index].classPerWeek??na, classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).subject, "Maths", classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).slot_type, controller.response.value.data?.schoolStaff?[index].slotType??na, classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
                (controller.response.value.data?.schoolStaff?[index].school?.staffsubjects?.classSection??[]).isNotEmpty
                    ? buildTile(translate(context).place_of_class, controller.response.value.data?.schoolStaff?[index].school?.staffsubjects?.classSection?[0].roomNo??na, classTakenSvg)
                    : SizedBox.shrink(),
                // buildTile(translate(context).place_of_class,"1,2", classTakenSvg),
                SizedBox(height: 0.5.h),
                buildTile(translate(context).grade_class, "G3 : H1 ,H2 , H3 , C5 , C3\nG4 : J4 , K5 ,K9 ,F2 ,F3", jobDetailSvg),
                const SizedBox(height: 20,),
              ]),
        ),
      ),
    );
  }
  Widget buildTile(String title, String subTitle, String svgImg){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
              SizedBox(height: 0.5.h,),
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: BaseColors.primaryColor),
                    borderRadius: BorderRadius.circular(10.0)
                ), child: Row(
                children: [
                  SvgPicture.asset(svgImg,height: 16.0,),
                  const SizedBox(width: 10,),
                  Text(subTitle, style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.5)),
                ],
              ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
      ],
    );
  }
}
