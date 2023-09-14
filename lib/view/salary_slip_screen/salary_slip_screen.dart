import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/intl/intl.dart';
import 'package:staff_app/view/salary_slip_screen/controller/salary_slip_controller.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

import '../../utility/sizes.dart';

class SalarySlipScreen extends StatefulWidget {
  const SalarySlipScreen({Key? key}) : super(key: key);

  @override
  State<SalarySlipScreen> createState() => _SalarySlipScreenState();
}

class _SalarySlipScreenState extends State<SalarySlipScreen> {

  SalarySlipController controller = Get.put(SalarySlipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Salary Slip"),
      body: Obx(()=>
          SmartRefresher(
            footer: const BasePaginationFooter(),
            controller: controller.refreshController,
            enablePullDown: enablePullToRefresh,
            enablePullUp: true,
            onLoading: (){
              controller.getData(refreshType: "load");
            },
            onRefresh: (){
              controller.getData(refreshType: "refresh");
            },
            child: (controller.list?.length??0) == 0 ? const BaseNoData()
                :
            ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(scaffoldPadding),
            itemCount: controller.list?.length??0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  showGeneralDialog(
                    context: context,
                    pageBuilder:  (context, animation, secondaryAnimation) {
                      return OpenPdfPopup(title: "Pay Slip of July");
                    },
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: BaseColors.darkShadowColor,
                        blurRadius: 3.0,
                        offset: Offset(0,3)
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 15.sp, bottom: 15.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: BaseColors.backgroundColor,
                          border: Border.all(color: BaseColors.primaryColor)
                        ),
                        child: Column(
                          children: [
                            Text(getDayOnly(controller.list?[index].createdAt??""), style: Style.montserratBoldStyle().copyWith(fontSize: 20.sp,color: BaseColors.txtPrimaryColor),),
                            Text(getMonthOnly(controller.list?[index].createdAt??""), style: Style.montserratMediumStyle().copyWith(fontSize: 17.sp,color: BaseColors.txtPrimaryColor),),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(toBeginningOfSentenceCase(controller.list?[index].payType??"")??"", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp,color: Colors.black),),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text("${controller.list?[index].amount?.toString()??""} AED", style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp,color: BaseColors.primaryColor),),
                        ],
                      ),
                      const Spacer(),
                      Visibility(
                        visible: (controller.list?[index].document??"").isNotEmpty,
                        child: BaseIcons().view(
                          url: controller.list?[index].document??"",
                          concatBaseUrl: true,
                        ),
                      ),
                      Visibility(
                        visible: (controller.list?[index].document??"").isNotEmpty,
                        child: SizedBox(width: 3.w),
                      ),
                      Visibility(
                        visible: (controller.list?[index].document??"").isNotEmpty,
                        child: BaseIcons().download(onRightButtonPressed: (){
                          BaseOverlays().dismissOverlay();
                          BaseAPI().download(controller.list?[index].document??"");
                        }),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
          ),
      ),
    );
  }
}
