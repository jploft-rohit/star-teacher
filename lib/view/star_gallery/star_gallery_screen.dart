import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/Utility/sizes.dart';
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
            duration: Duration(milliseconds: 300),
            alignment: 0.3,
            curve: Curves.easeInOutCubic);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Star Gallery"),
      floatingActionButton: BaseFloatingActionButton(onTap: () {
        Get.to(CreateGalleryScreen());
      }, title: 'Create Gallery'),
      body: ScrollablePositionedList.builder(
          itemCount: controller.list?.length??0,
          shrinkWrap: true,
          itemScrollController: itemScrollController,
          scrollOffsetController: scrollOffsetController,
          itemPositionsListener: itemPositionsListener,
          scrollOffsetListener: scrollOffsetListener,
          padding: EdgeInsets.symmetric(horizontal: scaffoldPadding,vertical: scaffoldPadding),
          itemBuilder: (context,index){
            return StarGalleryListTile(index: index);
          },
      )
    );
  }
}
