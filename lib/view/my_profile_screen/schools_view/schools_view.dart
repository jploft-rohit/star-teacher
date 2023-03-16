import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/map_screen.dart';

class SchoolsView extends StatefulWidget {
  const SchoolsView({Key? key}) : super(key: key);

  @override
  State<SchoolsView> createState() => _SchoolsViewState();
}

class _SchoolsViewState extends State<SchoolsView> {
  List<String> list = [
    "1. Ignite Group School",
    "2. UAE Public School",
    "3. Oman Public School",
  ];
  List<Map<String, dynamic>> list1 = [];

  @override
  Widget build(BuildContext context) {
    list1 = [
      {
        "title": translate(context).school_name,
        "subtitle": "Ignite Group School",
      },
      {
        "title": translate(context).staff_admin,
        "subtitle": "Ahmed Ali",
      },
      {
        "title": translate(context).school_category,
        "subtitle": "Govt. School",
      },
      {
        "title": translate(context).school_type,
        "subtitle": "Preschool , Cycle 1  ,  Cycle 2 , Cycle",
      },
      {
        "title": translate(context).school_name,
        "subtitle": "Ignite Group School",
      },
      {
        "title": translate(context).school_id,
        "subtitle": "#4425577",
      },
      {
        "title": translate(context).school_address,
        "subtitle": "located in Al Warqa'a 3,",
      },
      {
        "title": translate(context).school_sector,
        "subtitle": "Dubai",
      },
      {
        "title": translate(context).school_area,
        "subtitle": "Warqa'a 3",
      },
      {
        "title": translate(context).school_email,
        "subtitle": "ingnitea@school.com",
      },
      {
        "title": translate(context).school_contact_no,
        "subtitle": "6627729888",
      },
      {
        "title": translate(context).school_website,
        "subtitle": "www.schoolwebpage.com",
      },
    ];
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('${translate(context).list_of_located_schools} : ', style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp)),
                Text('3', style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp)),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: buildJobDetails(context, list[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJobDetails(BuildContext context, String heading){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: CustomColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: CustomColors.primaryColor,
              collapsedIconColor: CustomColors.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: Text(heading, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 17.sp)),
              backgroundColor: CustomColors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: list1.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            buildInfoItems(
                              list1[index]['title'] , list1[index]['subtitle'],),
                            if(index == 6)...[
                              Spacer(),
                              InkWell(
                                  onTap: (){
                                    Get.to(MapScreen());
                                  },child: SvgPicture.asset("assets/images/map_ig.svg")),
                            ],
                            if(index == 10)...[
                              SizedBox(
                                width: 1.w,
                              ),
                              SvgPicture.asset("assets/images/copy 2.svg"),
                            ]
                          ],
                        ),

                        Divider(
                          color: CustomColors.borderColor,
                          thickness: 1.0,
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).week_days_3, "Monday, Tuesday, Wednesday", "assets/images/Vector (1).svg"),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).number_of_classes_per_week, "30", classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).subject, "Maths", classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).slot_type, "Double", classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
                buildTile(translate(context).place_of_class, "Classroom, Computer Lab, Library", classTakenSvg),
                SizedBox(
                  height: 0.5.h,
                ),
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
              Text(title, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp)),
              SizedBox(height: 0.5.h,),
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.primaryColor),
                    borderRadius: BorderRadius.circular(10.0)
                ), child: Row(
                children: [
                  SvgPicture.asset(svgImg,height: 18.0,),
                  const SizedBox(width: 10,),
                  Text(subTitle, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp, height: 1.5)),
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
