import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';

class NewsDetailScreen extends StatefulWidget {
  final bool isShowAcknw;
  final NewsBroadCastData data;
  final int index;
  const NewsDetailScreen({Key? key,this.isShowAcknw=true, required this.data, required this.index}) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final DashboardScreenCtrl controller = Get.find<DashboardScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              addAlignedText(widget.data.title??"", 20.sp, const Color(0xFF072D4B), FontWeight.w700),
              SizedBox(height: 3.h,),
              addText(widget.data.message??"", 17.sp, const Color(0xFF072D4B).withOpacity(0.6), FontWeight.w400),
              SizedBox(height: 3.h,),
              Row(
                children: [
                  addText(widget.data.user?.name??"", 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
                  SizedBox(width: 3.w  ,),
                  addText(formatBackendDate(widget.data.updatedAt??""), 15, const Color(0xFF072D4B).withOpacity(0.4), FontWeight.w400),
                ],
              ),
              SizedBox(height: 6.h,),
              if(controller.list?[widget.index].isRead.toString() == "false")
                Center(
                  child: BaseButton(title: "AGREED", onPressed: (){
                    controller.agreeNewsBroadCast(id: controller.list?[widget.index].sId??"", index: widget.index);
                  },textSize: 17.sp),
                ),
              if(controller.list?[widget.index].isRead.toString() != "false")
                Center(
                  child: BaseButton(title: "AGREED", onPressed: (){}, isActive: false, textSize: 17.sp,),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
