import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';

import '../../../../star_gallery/star_gallery_screen.dart';

class HomeVideoTab extends StatefulWidget {
  const HomeVideoTab({Key? key}) : super(key: key);

  @override
  State<HomeVideoTab> createState() => _HomeVideoTabState();
}

class _HomeVideoTabState extends State<HomeVideoTab> {
  List<String> imagesList = [
    "assets/delete/star_image_1.png",
    "assets/delete/star_image_2.png",
    "assets/delete/star_image_3.png",
    "assets/delete/star_image_4.png",
    "assets/delete/star_image_5.png",
    "assets/delete/star_image_6.png",
    "assets/delete/star_image_7.png",
    "assets/delete/star_image_8.png",
    "assets/delete/star_image_6.png",
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: imagesList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.5.h,
          crossAxisSpacing: 1.h,
          mainAxisExtent: 17.h,
        ),
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Get.to(StarGalleryScreen());
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: BaseColors.primaryColor,width: 1),
              ),
              child:
              Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                          child: Image.asset(imagesList[index],fit: BoxFit.cover,))),
                  Positioned.fill(child: Center(child: SvgPicture.asset("assets/images/ic_play.svg",))),
                ],
              ),
            ),
          );
        });
  }
}
