import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/sub_tabs/home_photo_tab.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/sub_tabs/home_photo_video_tab.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/sub_tabs/home_video_tab.dart';

class StarGalleryTab extends StatefulWidget {
  const StarGalleryTab({Key? key}) : super(key: key);

  @override
  State<StarGalleryTab> createState() => _StarGalleryTabState();
}

class _StarGalleryTabState extends State<StarGalleryTab> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
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
          ]),
          SizedBox(height: 15),
          SizedBox(
            height: 40.h,
            child: AutoScaleTabBarView(
              controller: tabController,
              children: [
                HomePhotoVideoTab(),
                HomePhotoTab(),
                HomeVideoTab(),
            ]),
          )
        ],
      ),
    );
  }
}
