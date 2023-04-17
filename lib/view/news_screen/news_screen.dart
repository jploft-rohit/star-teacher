import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "News"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText("Latest Broadcasts & Events", 18.sp, BaseColors.textBlackColor, FontWeight.w700),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: BaseColors.backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: BaseColors.borderColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(const NewsDetailScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index == 0 ? const Color(0xFFF8F4E9) : const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffF2F2F2),
                              spreadRadius: 5.0,
                              blurRadius: 5.0,
                          )
                        ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Principal’s Honouring Ceremony", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam.", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: const Color(0xff072D4B), height: 2.0),),
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
                            SizedBox(
                              height: 3.h,
                            ),
                            if(index == 0)
                              Center(
                                child: BaseButton(title: "AGREED", onPressed: (){

                                },textSize: 17.sp),
                              ),
                            if(index == 1)
                            Center(
                              child: BaseButton(title: "Acknowledge", onPressed: (){

                              }, isActive: false, textSize: 17.sp,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
