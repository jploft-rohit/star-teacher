import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/sub_tabs/home_photo_video_tab.dart';
import 'package:staff_app/view/star_gallery/controller/star_gallery_ctrl.dart';

class StarGalleryTab extends StatefulWidget {
  const StarGalleryTab({Key? key}) : super(key: key);

  @override
  State<StarGalleryTab> createState() => _StarGalleryTabState();
}

class _StarGalleryTabState extends State<StarGalleryTab> with TickerProviderStateMixin{
  StarGalleryCtrl controller = Get.put(StarGalleryCtrl());
  late TabController tabController;

  @override
  void initState() {
    controller.getData(type: "both", showLoader: false);
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      controller.getData(type: (tabController.index) == 0 ? "both" : (tabController.index) == 1 ? "image" : "video", showLoader: false);
      controller.selectedTabIndex.value = tabController.index;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseTabBar(
            controller: tabController,
            tabs: [
            SvgPicture.asset("assets/images/ic_grid_view.svg",color: tabController.index == 0 ? BaseColors.primaryColor : Colors.black),
            SvgPicture.asset("assets/images/ic_gallery.svg",color: tabController.index == 1 ? BaseColors.primaryColor : Colors.black),
            SvgPicture.asset("assets/images/ic_videos.svg",color: tabController.index == 2 ? BaseColors.primaryColor : Colors.black),
           ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
                  HomePhotoVideoTab(),
                  HomePhotoVideoTab(),
                  HomePhotoVideoTab(),
                ],
             ),
          ),
        ],
      ),
    );
  }
}
