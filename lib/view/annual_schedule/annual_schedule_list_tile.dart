import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/annual_schedule/controller/annual_schedule_ctrl.dart';
import 'package:staff_app/view/annual_schedule/view_calendar.dart';

import '../../utility/images_icon_path.dart';

class AnnualScheduleListTile extends StatelessWidget {
  final AnnualScheduleCtrl controller = Get.find<AnnualScheduleCtrl>();
  AnnualScheduleListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
        itemCount: controller.list?.length??0,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GestureDetector(
            onTap: () {
              Get.to(AnnualViewCalendarScreen(index: index));
            },
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Text(controller.list?[index].title??"",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 17.sp)),
              leading: BaseImageNetwork(link: controller.list?[index].icon??"",height: 2.h,width: 2.h),
              tileColor: Color(int.parse(controller.list?[index].color??"")),
              subtitle: Text("${getMonthDate(controller.list?[index].startDate??"")} to ${getMonthDate(controller.list?[index].endDate??"")}",style: TextStyle(color: Colors.grey.shade700,fontSize: 15.sp)),
              trailing: SvgPicture.asset(calenderDateSvg),
              minLeadingWidth: 0,
            )
          ),
        );
      }),
    );
  }
}
