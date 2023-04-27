import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/view/star_gallery/star_gallery_screen.dart';

class HomePhotoVideoTab extends StatefulWidget {
  const HomePhotoVideoTab({Key? key}) : super(key: key);

  @override
  State<HomePhotoVideoTab> createState() => _HomePhotoVideoTabState();
}

class _HomePhotoVideoTabState extends State<HomePhotoVideoTab> {
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
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(index == 4 || index == 0 ? 0.6 : 0.0), BlendMode.darken),
                      child: Image.asset(imagesList[index],
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.darken,
                        ),
                    ),
                  ),
                  Visibility(child: Positioned.fill(child: Center(child: SvgPicture.asset("assets/images/ic_play.svg",))),visible: index == 4 || index == 0),
                ],
              ),
            ),
          );
    });
  }
}
