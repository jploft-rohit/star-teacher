import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staff_app/Utility/base_colors.dart';

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
          mainAxisExtent: 90,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context,index){
          return Container(
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
                ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.asset(imagesList[index],fit: BoxFit.fill,height: 100,width: 100,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.5))),
                SvgPicture.asset("assets/images/ic_play.svg",height: 30,width: 30,),
              ],
            ),
          );
        });
  }
}
