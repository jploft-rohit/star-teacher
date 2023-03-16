import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/print_qr_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/transportation_screen/change_address_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> listTitle = [
    "Request\nRaised",
    "Reviewed",
    "Approve"
  ];
  List<String> listDate = [
    "July 2, 8:30PM",
    "July 3, 10:30AM",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).location, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: CustomColors.borderColor
                    )
                ),
                child: ListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp, bottom: 15.sp),
                  leading: Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: CustomColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SvgPicture.asset(manSvg),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nawaj Alam", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("#12344534", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("English Teacher", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  trailing: InkWell(onTap: (){
                    showScanQrDialogue(context, false);
                  },child: SvgPicture.asset(qrCodeSvg)),
                ),
              ),
              SizedBox(height: 3.h,),
              Row(
                children: [
                  Flexible(flex: 1,child: CustomButton(text: translate(context).print_QR,  textSize: 15.sp,onPressed: (){
                    Get.to(PrintQrScreen());
                  },btnHeight: 30,),),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(flex: 1,child: CustomButton(text: translate(context).programme_NFC, textSize: 15.sp, onPressed: (){
                    showNFCDialog(context,"");
                  },btnHeight: 30,)),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: CustomColors.primaryColor,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  buildInfoItems(translate(context).location, "Liwa Tower; P.O. Box 901; Abu Dhabi")
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 25.h,
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomColors.primaryColor
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SvgPicture.asset(homeSvg, fit: BoxFit.scaleDown,),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems(translate(context).sector, "Dubai"),
                      SizedBox(
                        height: .5.h,
                      ),
                      buildInfoItems(translate(context).area, "Jumeriah"),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return ConfirmationDialog(msg: translate(context).are_you_sure_you_want_to_delete_the_location,isShowBtn: true,);
                            },
                          );
                        },
                        child: Icon(
                          CupertinoIcons.delete,
                          color: CustomColors.primaryColor,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: (){
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return ConfirmationDialog(msg: translate(context).are_you_sure_you_want_to_change_the_location,isShowBtn: true,);
                            },
                          ).then((value){
                            if(value == true){
                              Get.to(const ChangeAddressScreen());
                            }
                          });
                        },
                        child: Image.asset(editPng, height: 18.sp, color: CustomColors.primaryColor,),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).street, "53 B"),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).building_villa, "KM Tower"),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).flat_villa_no, "123456"),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).landmark, "Jumeriah"),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).mobile_no, "0503664321"),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).landline_no, "0503664321"),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(),
              SizedBox(
                height: 1.h,
              ),
              StepProgressView(
                width: MediaQuery.of(context).size.width,
                curStep: 2,
                color: CustomColors.primaryColor,
                titles: listDate,
                statuses: listTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
