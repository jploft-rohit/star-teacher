import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Star Gallery"),
      floatingActionButton: BaseFloatingActionButton(onTap: () {
        Get.to(CreateGalleryScreen());
      }, title: 'Create Gallery',),
      body: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
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
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 1,color: BaseColors.primaryColor),
                    ),
                    child: SvgPicture.asset("assets/images/nurse_img.svg",height: 22,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        style: TextStyle(color: BaseColors.primaryColor),
                        TextSpan(
                          children: [
                            TextSpan(text: 'Aftab ',style: TextStyle(fontWeight: FontWeight.bold),),
                            TextSpan(text: '(English Teacher)',style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      Text("Class: G4-H3",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 6),
              Text("The Kids did a wonderful job in reading time today",style: TextStyle(fontWeight: FontWeight.w500,color: BaseColors.primaryColor,fontSize: 16)),
              SizedBox(height: 8),
              Row(children: [
                SvgPicture.asset("assets/images/calender_date.svg",height: 12),
                SizedBox(width: 6),
                Text("Posted: 20 May 2023, 9:30 AM",style: TextStyle(fontSize: 10)),
              ]),
              SizedBox(height: 12),
              ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.asset("assets/delete/star_image_1.png",width: Get.width,fit: BoxFit.fitWidth,height: 170,)),
            ],
          ),
        );
      })
    );
  }
}
