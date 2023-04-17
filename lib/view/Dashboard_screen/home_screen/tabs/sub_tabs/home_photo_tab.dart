import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';

class HomePhotoTab extends StatefulWidget {
  const HomePhotoTab({Key? key}) : super(key: key);

  @override
  State<HomePhotoTab> createState() => _HomePhotoTabState();
}

class _HomePhotoTabState extends State<HomePhotoTab> {
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
          return Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: BaseColors.primaryColor,width: 1),
            ),
            child: Image.asset(imagesList[index],fit: BoxFit.fill,height: 60,width: 60,),
          );
        });
  }
}
