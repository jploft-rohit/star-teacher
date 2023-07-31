import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_loader.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';
import 'package:staff_app/view/news_screen/news_screen.dart';

class NewsBroadCastTab extends StatefulWidget {
  const NewsBroadCastTab({Key? key}) : super(key: key);

  @override
  State<NewsBroadCastTab> createState() => _NewsBroadCastTabState();
}

class _NewsBroadCastTabState extends State<NewsBroadCastTab> {

  DashboardScreenCtrl controller = Get.find<DashboardScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(translate(context).news_broadcast, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp)),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      height: 20.0,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: BaseColors.primaryColor
                      ),
                      child: Center(child: Text((controller.list?.length??0).toString(), style: Style.montserratRegularStyle().copyWith(color: Colors.white))),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(const NewsScreen())?.then((value){
                      controller.selectedSchoolId.value = "";
                      controller.selectedSchoolName.value = "";
                      controller.selectedClassId.value = "";
                      controller.selectedClassName.value = "";
                      controller.selectedSectionId.value = "";
                      controller.selectedSectionName.value = "";
                      controller.getBroadCastData(showLoader: true);
                    });
                  },
                  child: Text(translate(context).view_all, style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp ,decoration: TextDecoration.underline, color: BaseColors.txtPrimaryColor),),),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          controller.isBroadCastLoading.value
              ? BaseLoader()
              : ListView.builder(
            itemCount: (controller.list?.length??0) > 1 ? 2 : (controller.list?.length??0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 1.h),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(NewsDetailScreen(data: controller.list![index], index: index));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10),
                  width: getWidth(context),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: controller.list?[index].isRead.toString() == "false" ? const Color(0xFFF8F4E9) : const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: BaseColors.borderColor,
                          blurRadius: 8.0,
                          spreadRadius: 5
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.list?[index].title??"", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 16.sp,color: Colors.black),),
                      SizedBox(height: 1.h),
                      Text(controller.list?[index].message??"", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: Color(0xFF072D4B), height: 2.0),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          addText(controller.list?[index].user?.name??"", 14.sp,  Color(0xFF072D4B), FontWeight.w400),
                          SizedBox(
                            width: 10.w,
                          ),
                          addText(formatBackendDate(controller.list?[index].updatedAt??""), 14.sp,  Color(0xFF072D4B), FontWeight.w400),
                        ],
                      ),
                      Visibility(
                        visible: controller.list?[index].isRead.toString() == "false",
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.agreeNewsBroadCast(id: controller.list?[index].sId??"", index: index);
                                },
                                child: Card(
                                    elevation: 4,
                                    color: BaseColors.backgroundColor,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(color: BaseColors.primaryColor, width: 1.0),
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child:Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
                                      child: addText("Agree".toUpperCase(),15.sp,BaseColors.primaryColor,FontWeight.w700),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
