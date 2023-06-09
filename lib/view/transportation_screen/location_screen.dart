import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
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
      appBar: BaseAppBar(title: translate(context).location),
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
                        color: BaseColors.borderColor
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
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SvgPicture.asset(manSvg),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nawaj Alam", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("#12344534", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("English Teacher", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  // trailing: GestureDetector(onTap: (){
                  //   showScanQrDialogue(context, false);
                  // },child: SvgPicture.asset(qrCodeSvg)),
                ),
              ),
              SizedBox(height: 3.h),
              // Row(
              //   children: [
              //     Flexible(flex: 1,child: BaseButton(title: translate(context).print_QR,  textSize: 15.sp,onPressed: (){
              //       Get.to(PrintQrScreen());
              //     },),),
              //     SizedBox(
              //       width: 2.w,
              //     ),
              //     Flexible(flex: 1,child: BaseButton(title: translate(context).programme_NFC, textSize: 15.sp, onPressed: (){
              //       showNFCDialog(context,"");
              //     })),
              //   ],
              // ),
              // SizedBox(height: 2.h,),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: BaseColors.primaryColor,
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
                      color: BaseColors.primaryColor
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

                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
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
                        child: Image.asset(editPng, height: 18.sp, color: BaseColors.primaryColor,),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      GestureDetector(
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
                          color: BaseColors.primaryColor,
                          size: 18.sp,
                        ),
                      ),
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
              buildInfoItems(translate(context).mobile_no, "0503664321",svgPath: "assets/images/copy 2.svg",onSvgClick: () async {
                await Clipboard.setData(ClipboardData(text: "0503664321"));
                Fluttertoast.showToast(msg: "Copied");
              }),
              SizedBox(
                height: .5.h,
              ),
              buildInfoItems(translate(context).landline_no, "0503664321",svgPath: "assets/images/copy 2.svg",onSvgClick: () async {
                 await Clipboard.setData(ClipboardData(text: "0503664321"));
                 Fluttertoast.showToast(msg: "Copied");
              }),
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
                color: BaseColors.primaryColor,
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
