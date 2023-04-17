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
            mainAxisExtent: 90,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
        ),
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Get.to(StarGalleryScreen());
            },
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: BaseColors.primaryColor,width: 1),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.asset(imagesList[index],fit: BoxFit.fill,height: 100,width: 100,colorBlendMode: BlendMode.darken,color: index == 4 || index == 0 ? Colors.black.withOpacity(0.5):null)),
                  Visibility(visible: index == 4 || index == 0,child: SvgPicture.asset("assets/images/ic_play.svg",height: 30,width: 30,)),
                ],
              ),
            ),
          );
    });
  }
}
