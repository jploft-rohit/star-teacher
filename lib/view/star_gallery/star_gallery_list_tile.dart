import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/star_gallery_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_video_player.dart';
import 'package:staff_app/utility/base_views/base_video_thumbnail.dart';
import 'package:staff_app/view/star_gallery/controller/star_gallery_ctrl.dart';

class StarGalleryListTile extends StatefulWidget {
  final int index;
  const StarGalleryListTile({Key? key, required this.index}) : super(key: key);

  @override
  State<StarGalleryListTile> createState() => _StarGalleryListTileState();
}

class _StarGalleryListTileState extends State<StarGalleryListTile> {
  StarGalleryCtrl controller = Get.find<StarGalleryCtrl>();
  var _controller = PageController(viewportFraction: 1.0);
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
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
                child: BaseImageNetwork(link: controller.list?[widget.index].user?.profilePic??"",
                    concatBaseUrl: true,width: 3.h,height: 3.h),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    style: TextStyle(color: BaseColors.primaryColor),
                    TextSpan(
                      children: [
                        TextSpan(text:  controller.list?[widget.index].user?.name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                        TextSpan(text: ' (English Teacher)',style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Text("Class: ${controller.list?[widget.index].classes?.name??""}-${controller.list?[widget.index].section?.roomNo??""}",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700)),
                ],
              )
            ],
          ),
          SizedBox(height: 6),
          Text(controller.list?[widget.index].title??"N/A",style: TextStyle(fontWeight: FontWeight.w500,color: BaseColors.primaryColor,fontSize: 16.sp)),
          SizedBox(height: 8),
          Row(
              children: [
                SvgPicture.asset("assets/images/calender_date.svg",height: 2.h,width: 2.h,),
                SizedBox(width: 6),
                Text("Posted: ${formatBackendDate(controller.list?[widget.index].createdAt??"")}, ${getFormattedTime(controller.list?[widget.index].createdAt??"")}",style: TextStyle(fontSize: 14.sp)),
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
                  itemCount: controller.list?[widget.index].uploads?.length??0,
                  itemBuilder: ((context, internalIndex) => GestureDetector(
                    onTap: (){
                      if ((controller.list?[widget.index].uploads?[internalIndex].type??"") == "video") {
                        Get.to(BaseVideoPlayer(videoUrl: controller.list?[widget.index].uploads?[internalIndex].url??""))?.then((value){
                          setState(() {});
                          print("set state called");
                        });
                      }else{
                        photosView(index: internalIndex,imageList: controller.list?[widget.index].uploads??[]);
                      }
                    },
                    child: (controller.list?[widget.index].uploads?[internalIndex].type??"") == "video"
                        ? BaseVideoThumbnail(videoLink: controller.list?[widget.index].uploads?[internalIndex].url??"",addRoundness: true)
                        : BaseImageNetwork(
                          link: controller.list?[widget.index].uploads?[internalIndex].url??"",
                          concatBaseUrl: false,
                          fit: BoxFit.fill),
                  )),
                ),
              )),
          SizedBox(height: 1.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      controller.list?[widget.index].uploads?.length??0,
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
  }

  photosView({required int index,required List<Uploads>? imageList}){
    List<String> internalList = [];
    (imageList??[]).forEach((element) {
      if ((element.type??"") == "image") {
        internalList.add(element.url??"");
      }
    });
    showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
      return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          PhotoViewGallery.builder(
            itemCount: internalList.length??0,
            // scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int internalIndex) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(internalList[internalIndex]),
                initialScale: PhotoViewComputedScale.contained * 1.0,
                maxScale: PhotoViewComputedScale.contained * 3.0,
                minScale: PhotoViewComputedScale.contained * 0.8,
                heroAttributes: PhotoViewHeroAttributes(tag: internalList[internalIndex]),
              );
            },
            loadingBuilder: (context, event) => Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              ),
            ),
            pageController: PageController(initialPage: selectindex),
          ),
          Positioned(child: GestureDetector(
            onTap: (){
              BaseOverlays().dismissOverlay();
            },
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Icon(Icons.close_rounded,color: Colors.white,size: 40),
            ),
          )),
        ],
      );
    },
    );
  }
}
