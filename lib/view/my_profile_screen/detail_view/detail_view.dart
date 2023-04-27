import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/add_family_member/add_family_member.dart';
import 'package:staff_app/view/add_family_member/family_details_screen.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_view/my_profile_view.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  TextEditingController reasonCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildMyInformation(context),
            SizedBox(height: 2.h,),
            buildJobDetails(context),
            SizedBox(height: 2.h,),
            buildFamilyInfo(context),
            SizedBox(height: 2.h,)
          ],
        ),
      ),
    );
  }

  Widget buildMyInformation(BuildContext context){
    return  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: BaseColors.primaryColor)),
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
              iconColor: BaseColors.primaryColor,
              collapsedIconColor: BaseColors.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: Text(translate(context).my_information, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp)),
              backgroundColor: BaseColors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInfoItems(translate(context).mobile_no, '9563214563'),

                    BaseButton(
                      title: "Edit".toUpperCase(),
                      onPressed: (){
                        Get.to(const MyProfileView());
                      },
                      btnType: smallButton,
                      textSize: 14.sp,
                      verticalPadding: 0.5.h,
                      removeHorizontalPadding: true,
                      borderRadius: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(
                    translate(context).alternative_mobile, '9795214563'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(
                    translate(context).email, 'rafiq_khan007@gmail.com'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(translate(context).dob, '17 March, 1985'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(
                    translate(context).address, 'PO Box: 9440 Dubai UAE'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(translate(context).country, 'UAE'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(translate(context).sector, 'Dubai'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(translate(context).marital_status, 'Married'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(translate(context).nationality, 'Pakistan'),
                SizedBox(
                  height: 1.5.h,
                ),
                buildInfoItems(translate(context).emirates_ID, 'GT65349'),
                SizedBox(
                  height: 1.5.h,
                ),
                buildInfoItems(translate(context).expiry_date, '15 Sep, 2025',),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInfoItems("Document", 'doc.pdf'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              showGeneralDialog(
                                context: context,
                                pageBuilder:  (context, animation, secondaryAnimation) {
                                  return OpenPdfPopup(title: "doc.pdf");
                                },
                              );
                            },child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,size: 20.sp,)),
                        const SizedBox(width: 10,),
                        Icon(Icons.download_for_offline,color: BaseColors.primaryColor,size: 20.sp,)
                      ],
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     buildInfoItems('Emirates ID', 'GT65349'),
                //     buildInfoItems('Expiry Date', '15 Sep, 2025')
                //   ],
                // ),
                SizedBox(height: 2.h,)
              ]),
        ),
      ),
    );
  }

  Widget buildJobDetails(BuildContext context){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: BaseColors.primaryColor)),
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
              iconColor: BaseColors.primaryColor,
              collapsedIconColor: BaseColors.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: Text(translate(context).job_details, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp)),
              backgroundColor: BaseColors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                buildInfoItems(
                    translate(context).designation , 'Teacher'),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(
                    translate(context).date_of_employment , '23 May, 2019'),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(translate(context).job_grade, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                          SizedBox(height: 0.5.h,),
                          Container(
                            margin: EdgeInsets.only(bottom: 2.h),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: BaseColors.primaryColor),
                                borderRadius: BorderRadius.circular(10.0)
                            ), child: Row(
                            children: [
                              SvgPicture.asset(jobDetailSvg,height: 16.0,),
                              const SizedBox(width: 10,),
                              Text('14', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp)),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(translate(context).title_grade, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                          SizedBox(height: 0.5.h,),
                          Container(
                            margin: EdgeInsets.only(bottom: 2.h),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: BaseColors.primaryColor),
                                borderRadius: BorderRadius.circular(10.0)
                            ), child: Row(
                            children: [
                              SvgPicture.asset(jobDetailSvg,height: 16.0,),
                              const SizedBox(width: 10,),
                              Text('12 - 14', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp)),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(translate(context).job_title, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),),
                Container(
                  margin: EdgeInsets.only(top: 1.h,bottom: 2.h),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.primaryColor),
                      borderRadius: BorderRadius.circular(10.0)
                  ), child: Row(
                  children: [
                    SvgPicture.asset(classTakenSvg,height: 16.0,),
                    const SizedBox(width: 10,),
                    Text('Teacher', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp)),
                  ],
                ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(translate(context).subject, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),),
                Container(
                  margin: EdgeInsets.only(top: 1.h,bottom: 2.h),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.primaryColor),
                      borderRadius: BorderRadius.circular(10.0)
                  ), child: Row(
                  children: [
                    SvgPicture.asset(classTakenSvg,height: 16.0,),
                    const SizedBox(width: 10,),
                    Text('Maths', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp)),
                  ],
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translate(context).employment_certificate, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              showGeneralDialog(
                                context: context,
                                pageBuilder:  (context, animation, secondaryAnimation) {
                                  return OpenPdfPopup(title: translate(context).employment_certificate);
                                },
                              );
                            },child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,size: 20.sp,)),
                        const SizedBox(width: 10,),
                        Icon(Icons.download_for_offline,color: BaseColors.primaryColor,size: 20.sp,)
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: BaseColors.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translate(context).salary_certificate, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              showGeneralDialog(
                                context: context,
                                pageBuilder:  (context, animation, secondaryAnimation) {
                                  return OpenPdfPopup(title: translate(context).salary_certificate);
                                },
                              );
                            },child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,size: 20.sp,)),
                        const SizedBox(width: 10,),
                        Icon(Icons.download_for_offline,color: BaseColors.primaryColor,size: 20.sp,)
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: BaseColors.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translate(context).job_description, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                    Row(
                      children: [
                        GestureDetector(onTap: (){
                          showGeneralDialog(
                            context: context,
                            pageBuilder:  (context, animation, secondaryAnimation) {
                              return OpenPdfPopup(title: translate(context).job_description);
                            },
                          );
                        },child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,size: 20.sp,)),
                        const SizedBox(width: 10,),
                        Icon(Icons.download_for_offline,color: BaseColors.primaryColor,size: 20.sp,)
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: BaseColors.primaryColor,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(salarySlipScreenRoute);
                  },
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(translate(context).salary_slip, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),
                      Icon(Icons.arrow_forward,color: BaseColors.primaryColor,size: 18.sp,)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ]),
        ),
      ),
    );
  }

  Widget buildFamilyInfo(BuildContext context){
    return  Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: BaseColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              childrenPadding: EdgeInsets.zero,
              iconColor: BaseColors.primaryColor,
              collapsedIconColor: BaseColors.primaryColor,
              tilePadding: EdgeInsets.zero,
              title: Text(
                  translate(context).family_info,
                  style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp)),
              backgroundColor: BaseColors.white,
              children: <Widget>[
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translate(context).family_members, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp)),

                    GestureDetector(
                      onTap: (){
                        Get.to(const AddFamilyMemberScreen(isUpdating: false));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: BaseColors.backgroundColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: BaseColors.primaryColor)
                        ), child: Icon(Icons.add,color: BaseColors.primaryColor,size: 18.sp,),
                      ),
                    )

                  ],
                ),
                SizedBox(height: 2.h,),
                ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildFamilyItem(index,context);
                  },
                ),
                SizedBox(height: 2.h,),
              ]),
        ),
      ),
    );
  }



  Widget buildVerticalItems(String title,String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
          Text(description, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp)),
        ],
      ),
    );
  }

  Widget buildFamilyItem(int index,BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.to(const FamilyDetailsScreen());
      },
      child: Container(
        width: 100.w,
        margin:  const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: BaseColors.white,
            border: Border.all(color: BaseColors.borderColor,width: 2),
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoItems(translate(context).name, 'Salma Khan'),
                        SizedBox(
                          height: 1.h,
                        ),
                        buildInfoItems(translate(context).relation, 'Mother'),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(onTap: (){
                          Get.to(const AddFamilyMemberScreen(isUpdating: true));
                        },
                          child: Image.asset(editPng, color: BaseColors.primaryColor,height: 17.sp,),
                        ),
                        const SizedBox(width: 20,),
                        GestureDetector(onTap: (){
                          showDeleteDialog(context, index);
                        },
                          child: Icon(
                            CupertinoIcons.delete,
                            color: BaseColors.primaryColor,
                            size: 17.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }

  showDeleteDialog(BuildContext context,int index){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            backgroundColor: BaseColors.white,
            elevation: 10,
            scrollable: true,
            title: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:3.h),
                  child: Align(alignment: Alignment.center,
                    child: Text(
                      translate(context).remove_family_member,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 17.sp),),),
                ),

                Align(alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${translate(context).reason}: ",style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                    const SizedBox(height: 5,),
                    CustomTextField(controller: reasonCtrl, hintText: translate(context).type_here,borderRadius: 5.0,maxLine: 3,),
                    SizedBox(height: 2.h ,),
                    Align(
                      alignment: Alignment.center,
                      child: BaseButton(borderRadius: 20,btnType: mediumLargeButton,title: translate(context).delete.toUpperCase(), onPressed: () {Get.back();},),
                    )

                  ],
                ),
              ),
            )));
  }
}
