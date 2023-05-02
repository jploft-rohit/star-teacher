import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class SalarySlipScreen extends StatefulWidget {
  const SalarySlipScreen({Key? key}) : super(key: key);

  @override
  State<SalarySlipScreen> createState() => _SalarySlipScreenState();
}

class _SalarySlipScreenState extends State<SalarySlipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Salary Slip"),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
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
                  boxShadow: [
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
                          Text("10", style: Style.montserratBoldStyle().copyWith(fontSize: 20.sp,color: BaseColors.txtPrimaryColor),),
                          Text("June", style: Style.montserratMediumStyle().copyWith(fontSize: 17.sp,color: BaseColors.txtPrimaryColor),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment Received", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp,color: Colors.black),),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text("1000 AED", style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp,color: BaseColors.primaryColor),),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return OpenPdfPopup(title: "Payment Received");
                          },
                        );
                      },
                      child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    SvgPicture.asset(salarySlipDownloadSvg),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
