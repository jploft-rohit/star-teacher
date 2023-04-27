import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/view/star_gallery/create_gallery_screen.dart';

class StarGalleryScreen extends StatefulWidget {
  const StarGalleryScreen({Key? key}) : super(key: key);

  @override
  State<StarGalleryScreen> createState() => _StarGalleryScreenState();
}

class _StarGalleryScreenState extends State<StarGalleryScreen> {
  var _controller = PageController(viewportFraction: 1.0);
  int selectindex = 0;
  List<dynamic> imageList=[
    "assets/delete/star_image_1.png",
    "assets/delete/star_image_2.png",
    "assets/delete/star_image_3.png",
    "assets/delete/star_image_4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Star Gallery"),
      floatingActionButton: BaseFloatingActionButton(onTap: () {
        Get.to(CreateGalleryScreen());
      }, title: 'Create Gallery',),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: scaffoldPadding,vertical: scaffoldPadding),
              itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(bottom: 14),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1.0,
                    blurRadius: 4.0,
                    offset: Offset(0,0),
                  ),
                ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: BaseColors.primaryColor),
                        ),
                        child: SvgPicture.asset("assets/images/man_svg.svg",height: 4.h,width: 4.h,fit: BoxFit.cover,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            style: TextStyle(color: BaseColors.primaryColor),
                            TextSpan(
                              children: [
                                TextSpan(text: 'Aftab ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                                TextSpan(text: '(English Teacher)',style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Class: G4-H3",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  Text("The Kids did a wonderful job in reading time today",style: TextStyle(fontWeight: FontWeight.w500,color: BaseColors.primaryColor,fontSize: 16.sp)),
                  SizedBox(height: 8),
                  Row(
                      children: [
                    SvgPicture.asset("assets/images/calender_date.svg",height: 2.h,width: 2.h,),
                    SizedBox(width: 6),
                    Text("Posted: 20 May 2023, 9:30 AM",style: TextStyle(fontSize: 14.sp)),
                  ]),
                  SizedBox(height: 12),
                  Container(
                      width: 100.w,
                      height: 25.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: PageView.builder(
                          controller: _controller,
                          onPageChanged: (val) {
                            setState(() {
                              selectindex = val;
                            });
                          },
                          itemCount: imageList.length,
                          itemBuilder: ((context, index) => Image.asset(
                            imageList[index],
                            fit: BoxFit.cover,
                          )),
                        ),
                      )),
                  SizedBox(height: 1.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              imageList.length,
                                  (index) => AnimatedContainer(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 1.2.h,
                                  height: 1.2.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                      selectindex == index
                                          ? BaseColors.primaryColor
                                          : Color(0xFFE1E1E1)),
                                  duration: const Duration(milliseconds: 300)))),
                    ],
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 15.h,)
        ],
      )
    );
  }
}
