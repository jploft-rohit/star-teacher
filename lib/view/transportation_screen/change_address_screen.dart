import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/map_screen.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {

  TextEditingController typeYourLocationController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController flatController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController landlineController = TextEditingController();
  TextEditingController flatPhotoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).change_location),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/images/location1.svg"),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(translate(context).find_on_map, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      fillColor: BaseColors.txtFieldTextColor,
                      controller: typeYourLocationController,
                      hintText: translate(context).type_your_location,
                      hintTxtSize: 14.sp,
                      borderColor: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(MapScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
                      child: SvgPicture.asset(mapSvg,fit: BoxFit.cover,height: 3.h,),
                    ),
                  )
                ],
              ),
              Divider(
                color: BaseColors.txtFiledBorderColor,
                height: 0.0,
                endIndent: 40.sp,
                indent: 15.sp,
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).sector, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: sectorController,
                          hintText: "Dubai",
                          borderRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).area, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: areaController,
                          hintText: "Jumeriah",
                          borderRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).street, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: streetController,
                          hintText: "53 B",
                          borderRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).building_villa, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: buildingController,
                          hintText: "KM Tower A",
                          borderRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).flat_villa_no, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: flatController,
                          hintText: "#123456",
                          borderRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context).landmark, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: landmarkController,
                          hintText: "Jumeriah",
                          borderRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${translate(context).mobile_no}.", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: mobileController,
                          hintText: "0503664321",
                          borderRadius: 3.0,
                          textInputType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${translate(context).landline_no}.", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                        SizedBox(
                          height: .5.h,
                        ),
                        CustomTextField(
                          fillColor: BaseColors.txtFieldTextColor,
                          controller: landlineController,
                          hintText: "043674882",
                          borderRadius: 3.0,
                          textInputType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translate(context).flat_villa_photo, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                  SizedBox(
                    height: .5.h,
                  ),
                  CustomTextField(
                    fillColor: BaseColors.txtFieldTextColor,
                    controller: flatPhotoController,
                    hintText: translate(context).upload_photo,
                    borderRadius: 3.0,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SvgPicture.asset("assets/images/upload_icon.svg",),
                    ),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Text("${translate(context).photo_uploaded} 132KB", style: TextStyle(color: Color(0xff1C6BA4),fontSize: 13.sp),),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(child: BaseButton(title: translate(context).send_request, onPressed: (){
                    Get.back();
                  },btnType: largeButton,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
