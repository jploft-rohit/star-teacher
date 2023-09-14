import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/view/star_gallery/controller/star_gallery_ctrl.dart';
import 'package:staff_app/view/star_gallery/create_gallery_screen.dart';
import 'package:staff_app/view/star_gallery/star_gallery_list_tile.dart';

class StarGalleryScreen extends StatefulWidget {
  final int index;
  const StarGalleryScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<StarGalleryScreen> createState() => _StarGalleryScreenState();
}

class _StarGalleryScreenState extends State<StarGalleryScreen> {
  StarGalleryCtrl controller = Get.find<StarGalleryCtrl>();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      if (widget.index != 0) {
        itemScrollController.scrollTo(
            index: widget.index,
            duration: const Duration(milliseconds: 300),
            alignment: 0.3,
            curve: Curves.easeInOutCubic,
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Star Gallery"),
      floatingActionButton: BaseFloatingActionButton(onTap: () {
        Get.to(const CreateGalleryScreen());
      }, title: 'Create Gallery'),
      body: SmartRefresher(
        footer: const BasePaginationFooter(),
        controller: controller.refreshController,
        enablePullDown: enablePullToRefresh,
        enablePullUp: true,
        onLoading: (){
          controller.getData(refreshType: "load", type: (controller.selectedTabIndex.value) == 0 ? "both" : (controller.selectedTabIndex.value) == 1 ? "image" : "video", showLoader: false);
        },
        onRefresh: (){
          controller.getData(refreshType: "refresh", type: (controller.selectedTabIndex.value) == 0 ? "both" : (controller.selectedTabIndex.value) == 1 ? "image" : "video", showLoader: true);
        },
        child: ListView.builder(
            itemCount: controller.list?.length??0,
            shrinkWrap: true,
            // itemScrollController: itemScrollController,
            // scrollOffsetController: scrollOffsetController,
            // itemPositionsListener: itemPositionsListener,
            // scrollOffsetListener: scrollOffsetListener,
            padding: EdgeInsets.symmetric(horizontal: scaffoldPadding,vertical: scaffoldPadding),
            itemBuilder: (context,index){
              return StarGalleryListTile(index: index);
            },
        ),
      )
    );
  }
}
