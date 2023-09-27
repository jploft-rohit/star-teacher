import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_loader.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_video_thumbnail.dart';
import 'package:staff_app/view/star_gallery/controller/star_gallery_ctrl.dart';
import 'package:staff_app/view/star_gallery/star_gallery_screen.dart';

class HomePhotoVideoTab extends StatefulWidget {
  const HomePhotoVideoTab({Key? key}) : super(key: key);

  @override
  State<HomePhotoVideoTab> createState() => _HomePhotoVideoTabState();
}

class _HomePhotoVideoTabState extends State<HomePhotoVideoTab> with AutomaticKeepAliveClientMixin{
  StarGalleryCtrl controller = Get.find<StarGalleryCtrl>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>controller.isGalleryLoading.value
        ? Stack(
      children: [
        BaseLoader(linearProgress: true,rightMargin: 3.w,leftMargin: 3.w),
      ],
    )
        : (controller.list?.length??0) == 0
        ? const BaseNoData(message: "No Media Found")
        : GridView.builder(
        itemCount: controller.list?.length??0,
        shrinkWrap: true,
        cacheExtent: 999999,
        padding: EdgeInsets.only(bottom: 20.h),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1.5.h,
        crossAxisSpacing: 1.h,
        mainAxisExtent: 17.h,
        ),
        itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Get.to(StarGalleryScreen(index: index));
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: BaseColors.primaryColor,width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: (controller.list?[index].uploads?.first.type??"") == "video"
                  ? BaseVideoThumbnail(videoLink: controller.list?[index].uploads?.first.thumbnail??"")
                  : BaseImageNetwork(
                    link: controller.list?[index].uploads?.first.url??"",
                    cacheWidth: 300,
                    cacheHeight: 350,
                    concatBaseUrl: false,
              ),
            ),
          ),
        );
      },
     ),
   );
  }
  @override
  bool get wantKeepAlive => true;
}
