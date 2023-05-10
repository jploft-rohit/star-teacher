import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';
import 'package:staff_app/view/news_screen/news_screen.dart';

class NewsBroadCastTab extends StatefulWidget {
  const NewsBroadCastTab({Key? key}) : super(key: key);

  @override
  State<NewsBroadCastTab> createState() => _NewsBroadCastTabState();
}

class _NewsBroadCastTabState extends State<NewsBroadCastTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    child: Center(child: Text("2", style: Style.montserratRegularStyle().copyWith(color: Colors.white),)),
                  )
                ],
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const NewsScreen());
                },
                child: Text(translate(context).view_all, style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp ,decoration: TextDecoration.underline, color: BaseColors.txtPrimaryColor),),),
            ],
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 4.h),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(const NewsDetailScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10),
                  child: Container(
                    width: getWidth(context),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: index == 0 ? const Color(0xFFF8F4E9) : const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(15.0),
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
                        Text("Principal’s Honouring Ceremony", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam...", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: const Color(0xff072D4B), height: 2.0),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            addText("School Admin", 14.sp,  const Color(0xff072D4B), FontWeight.w400),
                            SizedBox(
                              width: 10.w,
                            ),
                            addText("15 mins ago", 14.sp,  const Color(0xff072D4B), FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
